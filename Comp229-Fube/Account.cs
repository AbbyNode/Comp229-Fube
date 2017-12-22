using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fube
{
    public class Account
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsAdmin { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Address { get; set; }


        public Account(int userID, string username, string password, bool isAdmin, string firstname, string lastname, string address)
        {
            UserID = userID;
            Username = username;
            Password = password;
            Firstname = firstname;
            Lastname = lastname;
            Address = address;
        }

        public Account(string username, string password, string firstname, string lastname, string address)
        {
            Username = username;
            Password = password;
            Firstname = firstname;
            Lastname = lastname;
            Address = address;
        }

    }
}