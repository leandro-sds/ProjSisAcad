using SisAcad.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SisAcad.Controllers
{
    [DataObject(true)]
    public class HistoricoController : ApiController
    {
        HistoricoDAL histDAL = new HistoricoDAL();

        
    }
}
