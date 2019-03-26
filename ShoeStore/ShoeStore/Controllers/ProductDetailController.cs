using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoeStore.Models;
namespace ShoeStore.Controllers
{
    public class ProductDetailController : Controller
    {
        private ShoseStoreDatabaseModels db = new ShoseStoreDatabaseModels();

        // GET: ProductDetail
        
        public ActionResult Index()
        {
            return RedirectToAction("Index", "AllProducts");
        }

        public ActionResult Product(int id) {
            var ListShoes = db.Shoes.ToList();
            var ListShoesDetail = db.ShoesDetails.ToList();
            Sho shose = new Sho();
            int isFinded = 0;
            foreach (Sho item in ListShoes) {
                if (item.idShoes == id) {
                    shose = item;
                    isFinded++;
                    break;
                }
            }
            if (isFinded == 0) return RedirectToRoute("AllProducts");
            ViewBag.Shose = shose;
            return View();

        }
    }
}