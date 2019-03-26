using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeStore.Controllers.Admin
{
    public class AdminProductController : Controller
    {
        // GET: AdminProduct
        public ActionResult Index()
        {
            return View();
        }
    }
}