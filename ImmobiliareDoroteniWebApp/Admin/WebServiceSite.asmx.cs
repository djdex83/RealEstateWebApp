using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using ImmobiliareDoroteniBackEnd;
using ImmobiliareDoroteniBackEnd.Entities;
using System.IO;

namespace ImmobiliareDoroteniWebApp.Admin
{
    /// <summary>
    /// Summary description for WS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WebServiceSite : System.Web.Services.WebService
    {
        #region Annunci
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<FotoEntity>  GetFotoByAnnuncio(string codice)
        {
           try
            {
                FotoDAL fs = new FotoDAL();
                //CategorieFotoDAL cf = new CategorieFotoDAL();
                //MioSitoBackEnd.CategoriaFoto catf = new MioSitoBackEnd.CategoriaFoto();
                //catf = cf.GetCategoria(Convert.ToInt32(categoria));
                List<Foto> lista = fs.GetByImmobile(codice);
                List<FotoEntity> listafoto = new List<FotoEntity>();
                foreach (Foto f in lista)
                {
                    FotoEntity fe = new FotoEntity();
                    fe.idFotoEntity = f.Id;
                    fe.Path = string.Concat("../", f.Path);
                    fe.CodiceImmobile = f.CodiceImmobile;
                    fe.Thumbnail = string.Concat("../", f.Path.Split('/')[0]  + "/resized/r_" + f.Path.Split('/')[1]);
                    fe.Descrizione = f.Descrizione;
                    fe.Copertina = f.Copertina.ToString();
                    listafoto.Add(fe);
                }
                return listafoto;
            }
            catch (Exception ex)
            {
                string messagge = ex.Message.ToString();
                return null;
            }
        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetLastCode(string typecontratto)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            return imdal.GetLastCode(typecontratto);
        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SaveNuovoAnnuncioImmobile(ImmobiliEntity immobile)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            imdal.SaveImmobile(immobile);

        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SaveNuovaCollaborazione(CollaborazioniEntity collaborazione)
        {
            CollaborazioniDAL colldal = new CollaborazioniDAL();
            colldal.SaveCollaborazioni(collaborazione);

        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void UpdateAnnuncio(ImmobiliEntity immobile)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            imdal.UpdateImmobile(immobile);
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void UpdateCollaborazione(CollaborazioniEntity collaborazione)
        {
            CollaborazioniDAL colldal = new CollaborazioniDAL();
            colldal.UpdateCollaborazioni(collaborazione);
        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ImmobiliEntitySite> GetTuttiAnnunciPubblici()
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            FotoDAL fdal = new FotoDAL();
            List<ImmobiliEntitySite> listaimmobili = new List<ImmobiliEntitySite>();
            foreach (ImmobiliareDoroteniBackEnd.Immobili i in imdal.GetAllPublic())
            {
                ImmobiliEntitySite Imm = new ImmobiliEntitySite();

                ImmobiliareDoroteniBackEnd.Foto f = fdal.GetCopertinaByImmobile(i.Codice);
                Imm.idImmobile = i.Id;
                Imm.Codice = i.Codice;
                Imm.Tipologia = i.Tipologia;
                Imm.Riscaldamento = i.Riscaldamento;
                Imm.Contratto = i.Contratto;
                Imm.DescrizioneBreve = i.DescrizioneBreve;
                Imm.Comune = i.Comune;
                Imm.Stato = i.Stato;
                Imm.Bagni = i.Bagni.ToString();
                Imm.Camere = i.Camere.ToString();
                Imm.Box = i.Box;
                if (!string.IsNullOrEmpty(i.BoxDoppio))
                {
                    Imm.BoxDoppio = i.BoxDoppio;
                }
                if (!string.IsNullOrEmpty(i.PostoAuto))
                {
                    Imm.PostoAuto = i.PostoAuto;
                }
                if (!string.IsNullOrEmpty(i.MqTerreno))
                {
                    Imm.MqTerreno = i.MqTerreno;
                }
                Imm.Mq = i.Mq.ToString();
                Imm.AnnuncioInEvidenza = (bool)i.AnnuncioInEvidenza;
                Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
                if (f != null)
                {
                    Imm.Thumbnail = string.Concat("../", f.Path.Split('/')[0] + "/resized/r_" + f.Path.Split('/')[1]);
                }
                else
                {
                    Imm.Thumbnail = string.Concat("../img/home.jpg");
                }
                listaimmobili.Add(Imm);
            }
            return listaimmobili;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ImmobiliEntitySite> GetTuttiAnnunci()
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            FotoDAL fdal = new FotoDAL();
            List<ImmobiliEntitySite> listaimmobili = new List<ImmobiliEntitySite>();
            foreach (ImmobiliareDoroteniBackEnd.Immobili i in imdal.GetAll())
            {
                ImmobiliEntitySite Imm = new ImmobiliEntitySite();

                ImmobiliareDoroteniBackEnd.Foto f = fdal.GetCopertinaByImmobile(i.Codice);
                Imm.idImmobile = i.Id;
                Imm.Codice = i.Codice;
                Imm.Tipologia = i.Tipologia;
                Imm.Riscaldamento = i.Riscaldamento;
                Imm.Contratto = i.Contratto;
                Imm.DescrizioneBreve = i.DescrizioneBreve;
                Imm.Comune = i.Comune;
                Imm.Bagni =  i.Bagni.ToString();
                Imm.Camere = i.Camere.ToString();
                Imm.Box = i.Box;
                Imm.Stato = i.Stato;
                if (!string.IsNullOrEmpty(i.BoxDoppio))
                {
                    Imm.BoxDoppio = i.BoxDoppio;
                }
                if (!string.IsNullOrEmpty(i.PostoAuto))
                {
                    Imm.PostoAuto = i.PostoAuto;
                }
                if (!string.IsNullOrEmpty(i.MqTerreno))
                {
                    Imm.MqTerreno = i.MqTerreno;
                }
                Imm.Mq = i.Mq.ToString();
                Imm.AnnuncioInEvidenza = (bool)i.AnnuncioInEvidenza;
                Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
                if (f != null)
                {
                    Imm.Thumbnail = string.Concat("../", f.Path.Split('/')[0] + "/resized/r_" + f.Path.Split('/')[1]);
                }
                else
                {
                    Imm.Thumbnail = string.Concat("../img/home.jpg");
                }
                listaimmobili.Add(Imm);
            }
            return listaimmobili;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CollaborazioniEntity> GetTutteCollaborazioni()
        {
            CollaborazioniDAL colldal = new CollaborazioniDAL();
            List<CollaborazioniEntity> listacollaborazioni = new List<CollaborazioniEntity>();
            foreach (CollaborazioniEntity i in colldal.GetAll())
            {
                CollaborazioniEntity c = new CollaborazioniEntity();
                c.Id = i.Id;
                c.Descrizione = i.Descrizione;
                c.Path= string.Concat("../img/collaborazioni/"+ i.Path.Split('/')[1]);
                listacollaborazioni.Add(c);
            }
            return listacollaborazioni;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Collaborazioni> Get10Collaborazioni()
        {
            CollaborazioniDAL colldal = new CollaborazioniDAL();
            List<Collaborazioni> listacollaborazioni = new List<Collaborazioni>();
            foreach (CollaborazioniEntity i in colldal.GetLast10())
            {
                Collaborazioni c = new Collaborazioni();
                c.Id = i.Id;
                c.Descrizione = i.Descrizione;
                c.Path = string.Concat("../", i.Path.Split('/')[0] + "/" + i.Path.Split('/')[1]);
                listacollaborazioni.Add(c);
            }
            return listacollaborazioni;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ImmobiliEntitySite> GetAnnuncioBySearch(string Codice, string[] Contratto, string Tipologia, string Comune, string Provincia,string Prezzo, string Camere, string Mq, bool TuttiContratti)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            FotoDAL fdal = new FotoDAL();
            List<ImmobiliEntitySite> listaimmobili = new List<ImmobiliEntitySite>();
            List<ImmobiliareDoroteniBackEnd.Immobili> _listaimmobili = imdal.GetBySearch(Codice, Contratto, Tipologia, Comune, Provincia, Prezzo, Camere, Mq,TuttiContratti);
            foreach (ImmobiliareDoroteniBackEnd.Immobili i in _listaimmobili )
            {
                ImmobiliEntitySite Imm = new ImmobiliEntitySite();

                ImmobiliareDoroteniBackEnd.Foto f = fdal.GetCopertinaByImmobile(i.Codice);
                Imm.idImmobile = i.Id;
                Imm.Codice = i.Codice;
                Imm.Tipologia = i.Tipologia;
                Imm.Contratto = i.Contratto;
                Imm.DescrizioneBreve = i.DescrizioneBreve;
                Imm.Comune = i.Comune;
                Imm.Riscaldamento = i.Riscaldamento;
                Imm.Bagni = i.Bagni.ToString();
                Imm.Camere = i.Camere.ToString();
                Imm.Box = i.Box;
                Imm.Stato = i.Stato;
                if (!string.IsNullOrEmpty(i.BoxDoppio))
                {
                    Imm.BoxDoppio = i.BoxDoppio;
                }
                if (!string.IsNullOrEmpty(i.PostoAuto))
                {
                    Imm.PostoAuto = i.PostoAuto;
                }
                if (!string.IsNullOrEmpty(i.MqTerreno))
                {
                    Imm.MqTerreno = i.MqTerreno;
                }
                Imm.Mq = i.Mq.ToString();
                Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
                if (f != null)
                {
                    Imm.Thumbnail = string.Concat("../", f.Path.Split('/')[0] + "/resized/r_" + f.Path.Split('/')[1]);
                }
                else
                {
                    Imm.Thumbnail = string.Concat("../img/home.jpg");
                }
                listaimmobili.Add(Imm);
            }
            return listaimmobili;
        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ImmobiliEntitySite> GetLast10Annunci()
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            List<ImmobiliEntitySite> listaimmobili = new List<ImmobiliEntitySite>();
            List<ImmobiliEntitySite> listimm = new List<ImmobiliEntitySite>();
            FotoDAL fdal=new FotoDAL();
            foreach (ImmobiliareDoroteniBackEnd.Immobili i in imdal.GetLast10())
            {
                ImmobiliEntitySite Imm = new ImmobiliEntitySite();
                
                ImmobiliareDoroteniBackEnd.Foto f=fdal.GetCopertinaByImmobile(i.Codice);
                Imm.idImmobile = i.Id;
                Imm.Stato = (i.Stato!="-1")?i.Stato:"n.d.";
                Imm.Codice = i.Codice;
                Imm.Tipologia = i.Tipologia;
                Imm.Contratto = i.Contratto;
                Imm.Riscaldamento = i.Riscaldamento;
                Imm.DescrizioneBreve = i.DescrizioneBreve;
                Imm.Comune = i.Comune;
                Imm.Bagni = i.Bagni.ToString();
                Imm.Camere = i.Camere.ToString();
                Imm.Mq = i.Mq.ToString();
                Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
                if (f != null)
                {
                    Imm.Thumbnail = string.Concat("../", f.Path.Split('/')[0] + "/resized/r_" + f.Path.Split('/')[1]);
                }
                else
                {
                    Imm.Thumbnail = string.Concat("../img/home.jpg");
                }
                listimm.Add(Imm);
            }
            return listimm;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ImmobiliEntitySite> GetEvidenzaAnnunci()
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            List<ImmobiliEntitySite> listaimmobili = new List<ImmobiliEntitySite>();
            List<ImmobiliEntitySite> listimm = new List<ImmobiliEntitySite>();
            FotoDAL fdal = new FotoDAL();
            foreach (ImmobiliareDoroteniBackEnd.Immobili i in imdal.GetEvidenza())
            {
                ImmobiliEntitySite Imm = new ImmobiliEntitySite();

                ImmobiliareDoroteniBackEnd.Foto f = fdal.GetCopertinaByImmobile(i.Codice);
                Imm.Codice = i.Codice;
                Imm.Tipologia = i.Tipologia;
                Imm.DescrizioneBreve = i.DescrizioneBreve;
                Imm.Contratto = i.Contratto;
                Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
                if (f != null)
                {
                    Imm.Thumbnail = f.Path;
                }
                else
                {
                    Imm.Thumbnail = string.Concat("../img/home.jpg");
                }
                listimm.Add(Imm);
            }
            return listimm;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ImmobiliEntitySite GetAnnuncio(string Codice)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            FotoDAL fdal = new FotoDAL();
            ImmobiliareDoroteniBackEnd.Immobili  i = imdal.GetByCodice(Codice);
            ImmobiliareDoroteniBackEnd.Foto f = fdal.GetCopertinaByImmobile(Codice);
            List<ImmobiliareDoroteniBackEnd.Foto> listfoto = fdal.GetByImmobile(Codice);
            ImmobiliEntitySite Imm = new ImmobiliEntitySite();
            Imm.AnnuncioPubblico = (bool)i.AnnuncioPubblico;
            Imm.Codice = i.Codice;
            Imm.Prezzo = string.Format("{0:n0}", i.Prezzo);
            if (i.Tipologia != null)
            {
                Imm.Tipologia = i.Tipologia;
            }
            if (i.Riscaldamento != null)
            {
                Imm.Riscaldamento = i.Riscaldamento;
            }
            if (i.Stato != null)
            {
                Imm.Stato = i.Stato;
            }
            if (i.Provincia != null)
            {
                Imm.Provincia = i.Provincia;
            }
            if (i.Comune != null)
            {
                Imm.Comune = i.Comune;
            }
            if (i.Zona != null)
            {
                Imm.Zona = i.Zona;
            }
            if (i.Mq != null)
            {
                Imm.Mq = i.Mq.ToString();
            }
            if (i.Bagni != null)
            {
                Imm.Bagni = i.Bagni.ToString();
            }
            if (!string.IsNullOrEmpty(i.Box))
            {
                Imm.Box = i.Box;
            }
            if (!string.IsNullOrEmpty(i.BoxDoppio))
            {
                Imm.BoxDoppio = i.BoxDoppio;
            }
            if (!string.IsNullOrEmpty(i.PostoAuto))
            {
                Imm.PostoAuto = i.PostoAuto;
            }
            if (!string.IsNullOrEmpty(i.MqTerreno))
            {
                Imm.MqTerreno = i.MqTerreno;
            }
            if (i.Camere != null)
            {
                Imm.Camere = i.Camere.ToString();
            }
            if (i.Ascensore != null)
            {
                Imm.Ascensore = i.Ascensore;
            }
            if (i.Locali != null)
            {
                Imm.Locali = i.Locali.ToString();
            }
            if (i.Piano != null)
            {
                Imm.Piano = i.Piano;
            }
            if (i.ClasseEnergetica != null)
            {
                Imm.ClasseEnergetica = i.ClasseEnergetica;
            }
            if (i.Contratto != null)
            {
                Imm.Contratto = i.Contratto;
            }
            Imm.Descrizione = i.Descrizione;
            Imm.DescrizioneBreve = i.DescrizioneBreve;
            Imm.AnnuncioPubblico = (bool)i.AnnuncioPubblico;
            Imm.AnnuncioInEvidenza = (bool)i.AnnuncioInEvidenza;
            Imm.ListFoto = new List<FotoEntity>();
            foreach (Foto foto in listfoto)
            {
                FotoEntity fe = new FotoEntity();
                fe.Path = foto.Path;
                fe.Thumbnail = string.Concat(foto.Path.Split('/')[0] + "/resized/r_" + foto.Path.Split('/')[1]);
                Imm.ListFoto.Add(fe);
            }
            if (f != null)
            {
                Imm.Thumbnail = f.Path;
            }
            else
            {
                Imm.Thumbnail = string.Concat("../img/home.jpg");
            }
            return Imm;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Collaborazioni GetCollaborazione(int Id)
        {
            CollaborazioniDAL colldal = new CollaborazioniDAL();
           
            Collaborazioni coll = colldal.GetByID(Id);


            return coll;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool DeleteAnnuncio(string codice)
        {
            ImmobiliDAL imdal = new ImmobiliDAL();
            return imdal.DeleteImmobile(codice);
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool DeleteCollaborazioni(int id)
        {
            CollaborazioniDAL imdal = new CollaborazioniDAL();
            return imdal.DeleteCollaborazioni(id);
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool DeleteFoto(string idfoto)
        {
            FotoDAL fdal = new FotoDAL();
            return fdal.DeletePhoto(Convert.ToInt32(idfoto));
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SetCopertina(string idfoto,string codice)
        {
            FotoDAL fdal = new FotoDAL();
            return fdal.SetCopertina(Convert.ToInt32(idfoto),codice);
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SetInEvidenza(string codice)
        {
            ImmobiliDAL immdal = new ImmobiliDAL();
            return immdal.SetInEvidenza(codice);
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string SaveFoto(List<FotoEntity> fotos)
        {
            try
            {
                FotoDAL fs = new FotoDAL();
                fs.SaveListFotoEntity(fotos);
                return "OK";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Creare setcopertina
        #endregion

        #region Contenuti
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetContenutoPagina(string pagina)
        {

            StreamReader sr = null;
            String line = string.Empty;
            try
            {
                if (!pagina.Equals("-1"))
                {

                    sr = new StreamReader(Server.MapPath("contenuti/" + pagina));
                    //Read the first line of text
                    line = sr.ReadToEnd();
                    //close the file
                    sr.Close();

                }


                return line;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return "Si è verificato un errore: " + ex.Message;
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void UpdateContenuti(string pagina, string testo)
        {
            string testot = testo;
            if (!pagina.Equals("-1"))
            {
                File.WriteAllText(Server.MapPath("contenuti/" + pagina), testo);
            }

        }
        #endregion

        #region Provincie_Comuni

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Provincie> GetProvincie()
        {
            List<Provincie> listProvincie = new List<Provincie>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listProvincie = (from a in entities.Provincie
                                     orderby a.Provincia ascending
                                     select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listProvincie;
        }
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Comuni> GetComuni(string sigla)
        {
            List<Comuni> listComune = new List<Comuni>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listComune = (from a in entities.Comuni
                                  where a.Provincia == sigla
                                  orderby a.Comune ascending
                                  select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listComune;
        }
        #endregion

    }
}