using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ImmobiliareDoroteniBackEnd.Entities;
using System.Linq.Expressions;

namespace ImmobiliareDoroteniBackEnd
{
    public class ImmobiliDAL
    {
        public List<Immobili> GetAll()
        {
            List<Immobili> listImmobili = new List<Immobili>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listImmobili = (from a in entities.Immobili
                                orderby a.Id descending
                                select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listImmobili;
        }
        public List<Immobili> GetAllPublic()
        {
            List<Immobili> listImmobili = new List<Immobili>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listImmobili = (from a in entities.Immobili
                                    where a.AnnuncioPubblico==true
                                    orderby a.Id descending
                                    select a).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listImmobili;
        }
        public List<Immobili> GetLast10()
        {
            List<Immobili> listImmobili = new List<Immobili>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listImmobili = (from a in entities.Immobili
                                    where a.AnnuncioPubblico==true
                                    orderby a.Id descending
                                    select a).Take(10).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listImmobili;
        }
        public List<Immobili> GetEvidenza()
        {
            List<Immobili> listImmobili = new List<Immobili>();
            try
            {
                using (var entities = new modelEntities())
                {

                    listImmobili = (from a in entities.Immobili
                                    where a.AnnuncioInEvidenza == true
                                    orderby a.Id descending
                                    select a).Take(4).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listImmobili;
        }
        public string GetLastCode(string typecontratto)
        {
            string code = string.Empty;
            List<Immobili> listImmobili = new List<Immobili>();

            try
            {
                using (var entities = new modelEntities())
                {
                    listImmobili = GetAll();
                    listImmobili=listImmobili.Where(a => a.Contratto == typecontratto).OrderByDescending(a => a.Id).Take(1).ToList();
                    code = listImmobili[0].Codice;

                    //code = (from a in entities.Immobili
                    //            where a.Contratto == typecontratto
                    //            orderby a.Id descending
                    //            select a).FirstOrDefault().Codice;
                }
                return code;
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return code;
            }
        }
        public List<Immobili> GetBySearch(string codice, string[] contratto, string tipologia, string comune, string provincia, string prezzo, string camere, string mq,bool tutticontratti)
        {
            List<Immobili> listImmobili = new List<Immobili>();
            int prezzo1 = 0, prezzo2 = 0, camere1 = 0, camere2 = 0, mq1 = 0, mq2 = 0;
            listImmobili = GetAllPublic();
            if (!prezzo.Equals("_") && !prezzo.Equals(""))
            {
                prezzo1 = Convert.ToInt32(prezzo.Split('_')[0].ToString());
                prezzo2 = Convert.ToInt32(prezzo.Split('_')[1].ToString());
            }
            else
            {
                prezzo = string.Empty;
            }
            if (!camere.Equals("_") && !camere.Equals(""))
            {
                camere1 = Convert.ToInt32(camere.Split('_')[0].ToString());
                camere2 = Convert.ToInt32(camere.Split('_')[1].ToString());
            }
            else
            {
                camere = string.Empty;
            }
            if (!mq.Equals("_")&& !mq.Equals(""))
            {
                mq1 = Convert.ToInt16(mq.Split('_')[0].ToString());
                mq2 = Convert.ToInt16(mq.Split('_')[1].ToString());
            }
            else
            {
                mq = string.Empty;
            }
            try
            {
                if (!string.IsNullOrEmpty(codice))
                {
                    codice = codice.ToUpper();
                    listImmobili = listImmobili.Where(a => a.Codice == codice).ToList();
                }
                if (tutticontratti == false)
                {
                    if (contratto.Length > 0)
                    {
                        if (contratto.Length == 1)
                        {
                            listImmobili = listImmobili.Where(a => a.Contratto == contratto[0] ).ToList();
                        }
                        if (contratto.Length == 2)
                        {
                            listImmobili = listImmobili.Where(a => a.Contratto == contratto[0] || a.Contratto == contratto[1]).ToList();
                        }
                        if (contratto.Length == 3)
                        {
                            listImmobili = listImmobili.Where(a => a.Contratto == contratto[0] || a.Contratto == contratto[1] || a.Contratto == contratto[2]).ToList();
                        }
                    }
                }
                if (!string.IsNullOrEmpty(provincia) && !provincia.Equals("Seleziona Provincia"))
                {
                    listImmobili = listImmobili.Where(a => a.Provincia == provincia).ToList();

                }
                if (!string.IsNullOrEmpty(comune) && !comune.Equals("Seleziona Comune"))
                {
                    listImmobili = listImmobili.Where(a => a.Comune == comune).ToList();
                }
                if (!string.IsNullOrEmpty(tipologia) && !tipologia.Equals("Tutti"))
                {
                    listImmobili = listImmobili.Where(a => a.Tipologia == tipologia).ToList();
                }
                if (!string.IsNullOrEmpty(prezzo))
                {
                    listImmobili = listImmobili.Where(a => a.Prezzo>= prezzo1 && a.Prezzo<=prezzo2).ToList();
                }
                if (!string.IsNullOrEmpty(camere))
                {
                    listImmobili = listImmobili.Where(a => a.Camere >= camere1 && a.Camere <= camere2).ToList();
                }
                if (!string.IsNullOrEmpty(mq))
                {
                    listImmobili = listImmobili.Where(a => a.Mq>=mq1 && a.Mq<=mq2).ToList();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
                return null;
            }

            return listImmobili;
        }


        public Immobili GetByCodice(string codice)
        {
            Immobili immobile = new Immobili();
            codice = codice.ToUpper();
            try
            {
                using (var entities = new modelEntities())
                {
                    immobile = (from a in entities.Immobili
                                where a.Codice == codice
                                select a).FirstOrDefault();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }

            return immobile;
        }
        public void SaveImmobile(ImmobiliEntity imm)
        {
            try
            {
                using (var entities = new modelEntities())
                {
                    Immobili immobile = new Immobili();
                    immobile.AnnuncioPubblico = imm.AnnuncioPubblico;
                    immobile.Codice=imm.Codice;
                    if (!imm.Prezzo.Equals(""))
                    {
                        immobile.Prezzo = Convert.ToInt32(imm.Prezzo);
                    }
                    immobile.Tipologia=imm.Tipologia;
                    immobile.Stato=imm.Stato;
                    immobile.Provincia=imm.Provincia;
                    immobile.Comune=imm.Comune;
                    immobile.Zona=imm.Zona;
                    if (!string.IsNullOrEmpty(imm.Mq))
                    {
                        immobile.Mq = Convert.ToInt16(imm.Mq);
                    }
                    if (!string.IsNullOrEmpty(imm.Bagni))
                    {
                        immobile.Bagni = Convert.ToInt16(imm.Bagni);
                    }
                    immobile.Box=imm.Box;
                    immobile.BoxDoppio = imm.Box;
                    immobile.PostoAuto = imm.PostoAuto;
                    immobile.MqTerreno = imm.MqTerreno;

                    if (!string.IsNullOrEmpty(imm.Camere))
                    {
                        immobile.Camere = Convert.ToInt16(imm.Camere);
                    }
                    immobile.Ascensore = imm.Ascensore;
                    if (!string.IsNullOrEmpty(imm.Locali))
                    {
                        immobile.Locali = Convert.ToInt16(imm.Locali);
                    }
                    if (!string.IsNullOrEmpty(imm.Riscaldamento))
                    {
                        immobile.Riscaldamento = imm.Riscaldamento;
                    }
                    immobile.Piano = imm.Piano;
                    immobile.ClasseEnergetica = imm.ClasseEnergetica;
                    immobile.Contratto = imm.Contratto;
                    immobile.Descrizione = imm.Descrizione;
                    immobile.DescrizioneBreve = imm.DescrizioneBreve;
                    immobile.AnnuncioPubblico = imm.AnnuncioPubblico;
                    immobile.AnnuncioInEvidenza = imm.AnnuncioInEvidenza;
                    entities.AddToImmobili(immobile);
                    entities.SaveChanges();
                }
            }
            catch (Exception e)
            {
                string errore = e.ToString();
            }
        }
        public bool UpdateImmobile(ImmobiliEntity imm)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Immobili immobile = (from p in entities.Immobili
                              where p.Codice == imm.Codice
                              select p).First();
                    immobile.Codice = imm.Codice;
                    string prezzo=imm.Prezzo;
                    if (prezzo.Contains('.')){
                        prezzo=imm.Prezzo.Split('.')[0] + imm.Prezzo.Split('.')[1];
                    }
                    immobile.Prezzo = Convert.ToInt32(prezzo);
                    immobile.Tipologia = imm.Tipologia;
                    immobile.Stato = imm.Stato;
                    immobile.Riscaldamento = imm.Riscaldamento;
                    immobile.Provincia = imm.Provincia;
                    immobile.Comune = imm.Comune;
                    immobile.Zona = imm.Zona;
                    immobile.Camere = string.IsNullOrEmpty(imm.Camere) ? 0 : Convert.ToInt16(imm.Camere);
                    immobile.Mq = string.IsNullOrEmpty(imm.Mq) ? 0:Convert.ToInt16(imm.Mq);
                    immobile.Bagni = string.IsNullOrEmpty(imm.Bagni) ? 0:Convert.ToInt16(imm.Bagni);
                    immobile.Box = imm.Box;
                    immobile.Ascensore = imm.Ascensore;
                    immobile.Locali = string.IsNullOrEmpty(imm.Locali)?0:Convert.ToInt16(imm.Locali);
                    immobile.Piano = imm.Piano;
                    immobile.ClasseEnergetica = imm.ClasseEnergetica;
                    immobile.Contratto = imm.Contratto;
                    immobile.Descrizione = imm.Descrizione;
                    immobile.DescrizioneBreve = imm.DescrizioneBreve;
                    immobile.AnnuncioPubblico = imm.AnnuncioPubblico;
                    immobile.AnnuncioInEvidenza = imm.AnnuncioInEvidenza;
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
        public bool SetPubblicoImmobile(string codice)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Immobili immobile = (from p in entities.Immobili
                                         where p.Codice == codice
                                         select p).First();
                    immobile.AnnuncioPubblico = true;
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
        public bool SetInEvidenza(string codice)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Immobili immobile = (from p in entities.Immobili
                                         where p.Codice == codice
                                         select p).First();
                    immobile.AnnuncioInEvidenza = true;
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
        public bool DeleteImmobile(string codice)
        {
            bool ok = true;
            try
            {
                using (var entities = new modelEntities())
                {
                    Immobili imm = (from l in entities.Immobili
                                 where l.Codice == codice
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