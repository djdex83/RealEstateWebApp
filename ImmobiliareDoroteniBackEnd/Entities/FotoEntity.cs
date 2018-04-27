using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImmobiliareDoroteniBackEnd.Entities
{
    public class FotoEntity
    {
        public int idFotoEntity { get; set; }
        public string Descrizione { get; set; }
        public string Thumbnail { get; set; }
        public string Path { get; set; }
        public string CodiceImmobile { get; set; }
        public string Copertina { get; set; }
    }
}