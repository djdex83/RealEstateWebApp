using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace ImmobiliareDotoreniWebApp.webcontrols
{
    public partial class Menu : System.Web.UI.UserControl
    {
        private string _MenuNode = string.Empty;

        #region properties

        public string MenuNode
        {
            get
            {
                return _MenuNode;
            }
            set
            {
                _MenuNode = value;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            XElement xelement = XElement.Load(Server.MapPath("~/Web.sitemap"));

            var urlDescList1 = xelement.Descendants()
              .SelectMany(sel => sel.Elements())
              .Select(nd => new
              {
                  title = nd.Attribute("title").Value,
                  url = nd.Attribute("url").Value,
                  description = nd.Attribute("description").Value
              });

            rptMenuSite.DataSource = urlDescList1;
            rptMenuSite.DataBind();
        }
        protected void rptMenuSite_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}

