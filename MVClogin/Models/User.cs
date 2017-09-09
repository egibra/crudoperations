//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace MVClogin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class User
    {
        public int UserID { get; set; }
        
        [DisplayName("User name")]
        [Required(ErrorMessage ="This field is required")]
        public string UserName { get; set; }
        [DisplayName("Password")]
        [Required(ErrorMessage = "This field is required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public string Surname { get; set; }
        [Range(1,3, ErrorMessage ="Please select role 1 - admin , 2 - manager, 3 - worker. there are no other roles.")]
        [Required(ErrorMessage = "This field is required")]
        public Nullable<int> Role { get; set; }
        [Range(1,1000000, ErrorMessage ="Please enter salary between 1 and 1000000 ")]
        [Required(ErrorMessage = "This field is required")]
        public double Salary { get; set; }
        public double Gross { get; set;  }

        public string LoginErrorMessage { get; set; }
    }
}
