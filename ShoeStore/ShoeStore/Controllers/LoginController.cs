using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeStore.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginResult(string username, string password)
        {
            if (username == "hieunh1801@gmail.com" && password == "123")
            {
                return Content("Login success");
            } else
            return RedirectToAction("Index");
        }
    }
}