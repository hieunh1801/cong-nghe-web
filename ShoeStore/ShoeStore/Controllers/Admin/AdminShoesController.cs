using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeStore.Controllers.Admin
{
    public class AdminShoesController : Controller
    {
        // GET: AdminShoes
        public ActionResult Index()
        {
            return View();
        }
    }
}