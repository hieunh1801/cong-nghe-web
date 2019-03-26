using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoeStore.Models;
namespace ShoeStore.Controllers
{
    public class HomeController : Controller
    {
        ShoseStoreDatabaseModels db = new ShoseStoreDatabaseModels();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult ProductListFeature()
        {
            ViewBag.ListShoes = db.Shoes.ToList();
            return PartialView("_ProductListFeature");
        }
    }
}