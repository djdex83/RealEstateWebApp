<%@ WebHandler Language="C#" Class="CheckFile" %>

using System;
using System.Web;
using System.IO;

public class CheckFile : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string path = context.Server.MapPath("../../Foto/");//context.Request.Form["folder"]);
        bool trovato = false;
        string json = "{";
        foreach (string s in context.Request.Form.AllKeys)
        {
            //if (!s.Equals("folder"))
            //{
                //verifico se il file esiste
                if (File.Exists(path + context.Request.Form[s]))
                {
                    //se true creo una string JSON per avvisare che il file esiste
                    trovato = true;
                    json += string.Format("'{0}':'{1}',", s, context.Request.Form[s]);
                }
            //}

        }
        if (!trovato)
        {
            //se non è stata trovata nessuna corrispondenza
            json = "{}";
        }
        else
        {
            json = json.Substring(0, json.Length - 1);
            json += "}";
        }


        //rilascio la stringa JSON
        context.Response.Write(json);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

