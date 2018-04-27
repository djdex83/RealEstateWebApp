using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ImmobiliareDoroteniBackEnd.Entities;

namespace ImmobiliareDoroteniBackEnd
{
    public class CollaborazioniDAL
    {
        public List<CollaborazioniEntity> GetAll()
        {
            List<Collaborazioni> listCollaborazioni = new List<Collaborazioni>();
            List<CollaborazioniEntity> listCollaborazionientity = new List<CollaborazioniEntity>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listCollaborazioni = (from a in entities.Collaborazioni
                                    orderby a.Id descending
                                    select a).ToList();
                    foreach (Collaborazioni c in listCollaborazioni)
                    {
                        CollaborazioniEntity coll = new CollaborazioniEntity();
                        coll.Descrizione = c.Descrizione;
                        coll.Id = c.Id;
                        coll.Path = c.Path;
                        listCollaborazionientity.Add(coll);
                    }
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listCollaborazionientity;
        }
        public Collaborazioni GetByID(int id)
        {
            Collaborazioni collaborazioni = new Collaborazioni();
            CollaborazioniEntity coll = new CollaborazioniEntity();
            try
            {
                using (var entities = new modelEntities())
                {

                    collaborazioni = (from a in entities.Collaborazioni
                                          where a.Id==id
                                          select a).FirstOrDefault();
                    coll.Descrizione = collaborazioni.Descrizione;
                    coll.Id = collaborazioni.Id;
                    coll.Path = collaborazioni.Path;
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return collaborazioni;
        }
        public List<CollaborazioniEntity> GetLast10()
        {
            List<Collaborazioni> listCollaborazioni = new List<Collaborazioni>();
            List<CollaborazioniEntity> listCollaborazionientity = new List<CollaborazioniEntity>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listCollaborazioni = (from a in entities.Collaborazioni
                                          orderby a.Id descending
                                          select a).ToList();
                    foreach (Collaborazioni c in listCollaborazioni)
                    {
                        CollaborazioniEntity coll = new CollaborazioniEntity();
                        coll.Descrizione = c.Descrizione;
                        coll.Id = c.Id;
                        coll.Path = c.Path;
                        listCollaborazionientity.Add(coll);
                    }
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listCollaborazionientity;
        }

        public void SaveCollaborazioni(CollaborazioniEntity coll)
        {
            try
            {
                using (var entities = new modelEntities())
                {
                    Collaborazioni collaborazioni = new Collaborazioni();

                    collaborazioni.Descrizione = coll.Descrizione;
                    collaborazioni.Path = coll.Path;
                    entities.AddToCollaborazioni(collaborazioni);
                    entities.SaveChanges();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }
        }
        public bool UpdateCollaborazioni(CollaborazioniEntity coll)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Collaborazioni col = (from p in entities.Collaborazioni
                                         where p.Id == coll.Id
                                         select p).First();
                    col.Descrizione = coll.Descrizione;

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
        public bool DeleteCollaborazioni(int id)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Collaborazioni imm = (from l in entities.Collaborazioni
                                    where l.Id == id
                                    select l).FirstOrDefault();
                    entities.DeleteObject(imm);
                    entities.SaveChanges();
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