﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class TrangChuController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Cart()
        {
            return View();
        }
        public ActionResult CheckOut()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}