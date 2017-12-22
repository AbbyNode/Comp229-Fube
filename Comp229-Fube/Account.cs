using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fube
{
    public class Account
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }

        public Account(int id, string email, string password, string firstName, string lastName, string address)
        {
            Id = id;
            Email = email;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            Address = address;
        }

        public Account(string email, string password, string firstName, string lastName, string address)
        {
            Email = email;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            Address = address;
        }

    }
}