using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MicrosoftTranslatorAJAX
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static AdmAuthentication _admAuth = new AdmAuthentication(AdmConstants.CLIENT_ID, AdmConstants.CLIENT_SECRET);

        protected void Page_Load(object sender, EventArgs e)
        {
            txtAuthToken.Text = _admAuth.GetAccessToken().access_token;
            txtAuthExpires.Text = _admAuth.GetAccessToken().expires_in;
        }
    }
}