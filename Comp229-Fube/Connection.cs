using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace Fube
{
    public class Connection
    {
        private static SqlConnection con;
        private static SqlCommand command;
        private static SqlDataReader sdr;
        static Connection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();
            con = new SqlConnection(connectionString);
            command = new SqlCommand("", con);
            sdr = command.ExecuteReader(); // What's role?
        }

        public static string loginAccount(string id, string password)
        {
            string result;
            string query = "SELECT * FROM Users WHERE username = '" + id + "' and password='" + password + "'";
            command.CommandText = query;
            con.Open();
            bool IsAdmin = sdr.GetBoolean(0);

            try
            {
                if (sdr.Read() && !IsAdmin)
                {
                    result = "user";
                    return result;
                }
                else
                {
                    if (sdr.Read() && IsAdmin)
                    {
                        result = "admin";
                        return result;
                    }
                    else
                    {
                        result = string.Empty;
                        return result;
                    }
                }
            }
            finally
            {
                con.Close();
            }
            
        }

        public static void createAccount(Account account)
        {
            string query = string.Format(@"INSERT INTO Users VALUES('{0}', '{1}', '{2}', '{3}', '{4}')",
                account.Username, account.Password, account.Firstname, account.Lastname, account.Address);
            command.CommandText = query;

            try
            {
                con.Open();
                command.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

    }
}