using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Net.Mail;
using System.IO;
using System.Net;

namespace ImmobiliareDoroteniWebApp
{
    public partial class Contatti : System.Web.UI.Page
    {
        //protected static string ReCaptcha_Key = "6LcHeAsTAAAAAAPELQxiPaowYRCl9iG5svvR8snp";
        //protected static string ReCaptcha_Secret = "6LcHeAsTAAAAADLp1sZ12um4uNfpjaZXa90FU0YR";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //[WebMethod]
        //public static string VerifyCaptcha(string response)
        //{
        //    string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        //    return (new WebClient()).DownloadString(url);
        //}
        [WebMethod(true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool InviaEmail(Messaggio messaggio)
        {
            try
            {
                MailMessage oMsg = new MailMessage();

                //Imposta il mittente
                oMsg.From = new MailAddress("sito@immobiliaredoroteni.it", "www.immobiliaredoroteni.it -  Email dal Sito");
                //La proprietà .To è una collezione di destinatari,
                //quindi possiamo addizionare quanti destinatari vogliamo.
                oMsg.To.Add(new MailAddress("info@immobiliaredoroteni.it"));
                //Imposto oggetto
                oMsg.Subject = "Email dal sito - " + messaggio.Oggetto;
                string TemplateName = System.Configuration.ConfigurationManager.AppSettings["EmailTemplate"];
                //Imposto contenuto
                StreamReader sReader = new StreamReader(HttpContext.Current.Server.MapPath(TemplateName));
                string htmlTemplate = sReader.ReadToEnd();
                htmlTemplate = htmlTemplate.Replace("[DATA]", DateTime.Now.ToShortDateString());
                htmlTemplate = htmlTemplate.Replace("[NOME]", messaggio.Nome);
                htmlTemplate = htmlTemplate.Replace("[TELEFONO]", messaggio.Telefono);
                htmlTemplate = htmlTemplate.Replace("[EMAIL]", messaggio.Email);
                htmlTemplate = htmlTemplate.Replace("[OGGETTO]", messaggio.Oggetto);
                htmlTemplate = htmlTemplate.Replace("[TESTO]", messaggio.Testo);
                sReader.Close();
                oMsg.Body = htmlTemplate;
                oMsg.IsBodyHtml = true;
                //Imposto il Server Smtp
               /* var smtp = new SmtpClient
                {
                    Host = "smtp.immobiliaredoroteni.it",
                    Port = 25,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential("sito@immobiliaredoroteni.it", "Mailsito11")
                };*/
                SmtpClient oSmtp = new SmtpClient("smtp.immobiliaredoroteni.it");
                //Possiamo impostare differenti metodi di spedizione.
                //Imposta consegna diretta.
                oSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //Alcuni Server SMTP richiedono l'accesso autenticato
                NetworkCredential oCredential = new NetworkCredential("sito@immobiliaredoroteni.it", "Mailsito11");
                oSmtp.UseDefaultCredentials = false;
                oSmtp.Credentials = oCredential;
                //Spediamo la mail
                oSmtp.Send(oMsg);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return false;
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }
        }

        public class Messaggio
        {
            public string Nome { get; set; }
            public string Email { get; set; }
            public string Telefono { get; set; }
            public string Oggetto { get; set; }
            public string Testo { get; set; }
        }
    }
}