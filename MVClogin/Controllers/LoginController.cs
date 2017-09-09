using MVClogin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;

namespace MVClogin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        // returns the login view.
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        // checks if given username and password matches in the database. If matches 
        // redirects to the session depending on the role(admin, manager, worker), 
        // if it doesn't, redirects to login page.
        public ActionResult Autherize(MVClogin.Models.User userModel)
        {
            userModel.Password = Encrypt(userModel.Password);
            using (LoginDataBaseEntities1 db = new LoginDataBaseEntities1())
            {
                var userDetails = db.Users.Where(x => x.UserName == userModel.UserName && x.Password == userModel.Password).FirstOrDefault();
                if (userDetails == null)
                {
                    userModel.LoginErrorMessage = "Wrong username or password";
                    userModel.Password = "";
                    return View("Index", userModel);
                }

                else
                {
                    Session["UserID"] = userDetails.UserID;
                    Session["Name"] = userDetails.Name;
                    Session["Surname"] = userDetails.Surname;
                    Session["Gross"] = userDetails.Salary * 3;
                    Session["Salary"] = userDetails.Salary * 2;
                    Session["Role"] = userDetails.Role;
                    if (userDetails.Role == 1)
                        return RedirectToAction("Admin", "Home");
                    else if (userDetails.Role == 2)
                        return RedirectToAction("Manager", "Home");
                    return RedirectToAction("Worker", "Home");
                }
            }
            
        }
        // abandons the session and returns to the login page
        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
        // encrypts the password with md5 hash. this functions is used to compare given password with the 
        // database user's password.
        private static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }

        }
    }
}