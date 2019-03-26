using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class TatCaSanPhamController : Controller
    {
        private ShopShoseDatabaseModels db = new ShopShoseDatabaseModels(); 
        
        // GET: TatCaSanPham
        public ActionResult Index()
        {

            return View(db.Shoes.ToList());
        }
        
    }
}