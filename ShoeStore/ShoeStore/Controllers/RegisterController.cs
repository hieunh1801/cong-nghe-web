using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeStore.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegisterResult(string username, string password, string confirmPassword, string name)
        {
            if (password == confirmPassword)
            {
                return Content("Register Success");
            } else
                return RedirectToAction("Index");
        }
    }
}