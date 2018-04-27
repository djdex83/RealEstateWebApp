using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImmobiliareDoroteniBackEnd.Entities
{
    public class ImmobiliEntity
    {
        public int idImmobile{ get; set; }
        public string Codice { get; set; }
        public string Prezzo { get; set; }
        public string Tipologia { get; set; }
        public string Stato { get; set; }
        public string Provincia { get; set; }
        public string Comune { get; set; }
        public string Zona { get; set; }
        public string Riscaldamento { get; set; }
        public string Mq { get; set; }
        public string MqTerreno { get; set; }
        public string Bagni { get; set; }
        public string Ascensore { get; set; }
        public string Camere { get; set; }
        public string Locali { get; set; }
        public string Box { get; set; }
        public string BoxDoppio { get; set; }
        public string PostoAuto { get; set; }
        public string Piano { get; set; }
        public string ClasseEnergetica { get; set; }
        public string Descrizione { get; set; }
        public string DescrizioneBreve { get; set; }
        public string Contratto { get; set; }
        public DateTime DataInserimento { get; set; }
        public bool AnnuncioPubblico { get; set; }
        public bool AnnuncioInEvidenza { get; set; }
    }
}