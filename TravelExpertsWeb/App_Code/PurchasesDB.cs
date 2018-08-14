using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

//***** Brijesh start ***** //
namespace TravelExpertsWeb.App_Code
{
    [DataObject(true)]

    public static class PurchasesDB
    {


        [DataObjectMethod(DataObjectMethodType.Select)]


        public static List<Purchases> GetPurchasesByEmail(string custEmail)
        {
            List<Purchases> purc = new List<Purchases>();
            Purchases puchase = null;
            SqlConnection con = TravelExpertsDB.GetConnection();
            var total = 0;

            // Create the SQL select statement.  
            string selectStatement = " select b.BookingDate as BookingDate, (p.ProdName + ' ' + s.SupName) as name, " +
                                    "(bd.BasePrice + bd.AgencyCommission) as price " +
                                    "from Bookings b " +
                                    "inner " +
                                    "join BookingDetails bd on b.BookingId = bd.BookingId " +
                                    "inner join Customers c on b.CustomerId = c.CustomerId " +
                                    "inner join Products_Suppliers ps on bd.ProductSupplierId = ps.ProductSupplierId " +
                                    "inner  join Products p on p.ProductId = ps.ProductId " +
                                    "inner  join Suppliers s on s.SupplierId = ps.SupplierId " +
                                    "where c.CustEmail = @CustEmail " +
                                    "union " +
                                    "select b.BookingDate as BookingDate , p.PkgName as name, " +
                                    "(p.PkgBasePrice + p.PkgAgencyCommission) as price " +
                                    "from Bookings b " +
                                    "inner " +
                                    "join Packages p on b.PackageId = p.PackageId " +
                                    "inner join Customers c on b.CustomerId = c.CustomerId " +
                                    "where c.CustEmail = @CustEmail ";

            SqlCommand cmd = new SqlCommand(selectStatement, con);
            cmd.Parameters.AddWithValue("@CustEmail", custEmail);

            try
            {
                // Open the connection and run the insert command
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    puchase = new Purchases();
                    puchase.BookingDate = Convert.ToDateTime(reader["BookingDate"]);
                    puchase.Name = reader["name"].ToString();
                    puchase.Price = Convert.ToDecimal(reader["price"]);
                    purc.Add(puchase);
                }


            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }


            return purc;
        }

    }
}
//***** Brijesh end ***** //