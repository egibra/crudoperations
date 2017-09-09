using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVClogin.Models;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace MVClogin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        // returns admin view. 
        public ActionResult Admin()
        {
            return View();
        }
        // gets data from the database and counts approximate gross of each user. 
        public ActionResult GetData()
        {
            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {

                List<User> empList = db.Users.ToList<User>();
                foreach (User usr in empList)
                {
                    usr.Gross = approxGross(usr.Salary);
                }
                return Json(new { data = empList }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult Add(int id = 0)
        {
            return View(new User());
        }
        [HttpPost]
        //adds a new user to database
        public ActionResult Add(User emp)
        {
            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {
                emp.Password = Encrypt(emp.Password);

                if (db.Users.Where(x => x.UserName == emp.UserName).FirstOrDefault() == null)
                {
                    db.Users.Add(emp);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Saved Successfully" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { success = false, message = "Username already exists" }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        [HttpGet]
        // returns the information about editing user
        public ActionResult Edit(int id)
        {
            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {
                return View(db.Users.Where(x => x.UserID == id).FirstOrDefault<User>());
            }
        }
        [HttpPost]
        //updates user's data
        public ActionResult Edit(User emp)
        {

            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {
                db.Entry(emp).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new { success = true, message = "Updated Successfully" }, JsonRequestBehavior.AllowGet);

            }


        }
        [HttpPost]
        // deletes user from database
        public ActionResult Delete(int id)
        {
            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {
                User emp = db.Users.Where(x => x.UserID == id).FirstOrDefault<User>();
                db.Users.Remove(emp);
                db.SaveChanges();
                return Json(new { success = true, message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);
            }
        }
        // returns managers page.
        public ActionResult Manager()
        {
            return View();
        }
        // returns workers page.
        public ActionResult Worker()
        {
            return View();
        }
        // encrypts user's password with md5 hash.
        private static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }

        }
        // function that calculates approximate gross with given net 
        public static double approxGross (double net)
        {
            double gross = 0;
            if (net <= 310)
            {
                gross = net / 0.91;
            }
            else if (net > 310 && net <= 380)
            {
                gross = (net - 46.5) / 0.76;
            }
            else if (net > 380 && net < 760)
            {
                gross = (net - 75) / 0.685;
            }
            else
            {
                gross = net / 0.76;
            }
            gross =  Math.Round(gross, 2);
            return gross;
        }
    }
}