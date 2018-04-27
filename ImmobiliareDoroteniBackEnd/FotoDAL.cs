using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ImmobiliareDoroteniBackEnd.Entities;
using System.IO;

namespace ImmobiliareDoroteniBackEnd
{
    public class FotoDAL
    {
        public List<Foto> GetAll()
        {
            List<Foto> listFoto = new List<Foto>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listFoto = (from a in entities.Foto
                                orderby a.Id ascending
                                select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listFoto;
        }
        public List<Foto> GetByImmobile(string codice)
        {
            List<Foto> listFoto = new List<Foto>();
            try
            {
                using (var entities = new modelEntities())
                {
                    listFoto = (from a in entities.Foto
                                where a.CodiceImmobile == codice
                                orderby a.Id ascending
                                select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }

            return listFoto;
        }
        public Foto GetCopertinaByImmobile(string codice)
        {
            List<Foto> listFoto = new List<Foto>();
            Foto copertina = new Foto();
            try
            {
                using (var entities = new modelEntities())
                {
                    listFoto = (from a in entities.Foto
                                where a.CodiceImmobile == codice && a.Copertina == 1
                                orderby a.Id ascending
                                select a).ToList();
                    if (listFoto.Count > 1)
                    {
                        copertina = listFoto[0];
                    }
                    if (listFoto.Count == 0)
                    {
                       copertina= (from a in entities.Foto
                                     where a.CodiceImmobile == codice 
                                     orderby a.Id ascending
                                     select a).FirstOrDefault();
                    }
                    if (listFoto.Count == 1)
                    {
                        copertina = listFoto[0];
                    }
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }

            return copertina;
        }
        public Foto GetByID(int idfoto)
        {
            Foto f=new Foto();
            try
            {
                using (var entities = new modelEntities())
                {
                    f = (from a in entities.Foto
                                where a.Id==idfoto
                                select a).FirstOrDefault();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }

            return f;
        }
        public void SaveListFotoEntity(List<FotoEntity> fotos)
        {
            foreach (FotoEntity f in fotos)
            {
                if (!string.IsNullOrEmpty(f.Path))
                {
                    f.Path = "Foto" + f.Path;
                    SavePhoto(f);
                }
            }
        }
        public void SavePhoto(FotoEntity photo)
        {
            try
            {
                using (var entities = new modelEntities())
                {
                    Foto foto = new Foto();
                    foto.Descrizione = photo.Descrizione;
                    foto.Path = photo.Path;
                    foto.Copertina = 0;
                    foto.CodiceImmobile = photo.CodiceImmobile;                  
                    entities.AddToFoto(foto);
                    entities.SaveChanges();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }
        }
        public bool UpdatePhoto(int idfoto,string descrizione)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Foto f = (from p in entities.Foto
                              where p.Id == idfoto
                              select p).First();
                    f.Descrizione = descrizione;
                    entities.SaveChanges();
                    
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return ok = false;
            }
            return ok;
        }
        public bool SetCopertina(int idfoto,string codice)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    List<Foto> listafoto = (from p in entities.Foto
                                             where p.CodiceImmobile == codice
                                             select p).ToList();
                    foreach (Foto fo in listafoto)
                    {
                        fo.Copertina = 0;
                    }
                    Foto f = (from p in entities.Foto
                              where p.Id == idfoto
                              select p).First();
                    f.Copertina=1;
                    entities.SaveChanges();

                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return ok = false;
            }
            return ok;
        }
        public bool DeletePhoto(int idfoto)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Foto foto = (from l in entities.Foto
                                 where l.Id == idfoto
                                 select l).FirstOrDefault();
                    string pathfoto = foto.Path;
                    entities.DeleteObject(foto);
                    entities.SaveChanges();
                    File.Delete(pathfoto);
                    return ok;
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                ok = false;
                return ok;
            }
        }

      
    }
}