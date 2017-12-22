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
        static Connection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();
            con = new SqlConnection(connectionString);
            command = new SqlCommand("", con);
        }

        public static string loginAccount(string id, string password)
        {
            string result;
            string query = "SELECT * FROM Users WHERE email = '" + id + "' and password='" + password + "'";
            string query2 = "SELECT * FROM Admin WHERE email = '" + id + "' and password='" + password + "'";
            command.CommandText = query;
            con.Open();
            SqlDataReader sdr = command.ExecuteReader(); // What's role?

            try
            {
                if (sdr.Read())
                {
                    result = "user";
                    return result;
                }
                else
                {
                    sdr.Close();
                    SqlCommand command2 = new SqlCommand(query2, con);
                    SqlDataReader sdr2 = command2.ExecuteReader();
                    if (sdr2.Read())
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
                account.Email, account.Password, account.FirstName, account.LastName, account.Address);
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