/*
 * Travel Experts Workshop 5
 * CustomerDB.cs
 * Author:  Corinne Mullan
 * Date:    July 24, 2018
 */

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWeb.App_Code
{
    [DataObject(true)]
    public static class CustomerDB
    {
        /// <summary>
        /// The GetCustomerByEmail() retrieves data for the customer from the Customers
        /// table, for the customer specified by the email address.  This is because the
        /// customer's email is used as their login ID.  Although not all customers have an
        /// email address, having an email address is a prerequisite for registering online.
        /// An email address can only be associated with one user account; if it is associated
        /// with more than one record, only the first will be retrieved from the database.
        /// </summary>
        /// <param name="custEmail"></param>
        /// <returns>Customer object</returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Customer GetCustomerByEmail(string custEmail)
        {
            Customer cust = null;

            SqlConnection con = TravelExpertsDB.GetConnection();

            // Create the SQL select statement.  
            string selectStatement = "SELECT CustomerId, CustFirstName, CustLastName, CustAddress, " +
                                     "CustCity, CustProv, CustPostal, CustCountry, " +
                                     "CustHomePhone, CustBusPhone, CustEmail " +
                                     "FROM Customers " +
                                     "WHERE CustEmail = @CustEmail"; 

            SqlCommand cmd = new SqlCommand(selectStatement, con);
            cmd.Parameters.AddWithValue("@CustEmail", custEmail);

            try
            {
                // Open the connection and run the insert command
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

                if (reader.Read())
                {
                    cust = new Customer();

                    cust.CustomerId = Convert.ToInt32(reader["Customerid"]);
                    cust.CustFirstName = reader["CustFirstName"].ToString();
                    cust.CustLastName = reader["CustLastName"].ToString();
                    cust.CustAddress = reader["CustAddress"].ToString();
                    cust.CustCity = reader["CustCity"].ToString();
                    cust.CustProv = reader["CustProv"].ToString();
                    cust.CustPostal = reader["CustPostal"].ToString();
                    cust.CustCountry = reader["CustCountry"].ToString();
                    cust.CustHomePhone = reader["CustHomePhone"].ToString();
                    cust.CustBusPhone = reader["CustBusPhone"].ToString();
                    cust.CustEmail = reader["CustEmail"].ToString();

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

            return cust;
        }

        /// <summary>
        /// The InsertCustomer() method adds a record for a new customer to the Customers
        /// table in the database.
        /// </summary>
        /// <param name="newCust"></param>
        /// <returns>The number of rows added (0 or 1)</returns>
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static int InsertCustomer(Customer newCust)
        {
            SqlConnection con = TravelExpertsDB.GetConnection();

            // Create the SQL insert statement.  Note that the CustomerId will be automatically
            // generated.  The AgentId is left null at this point.
            string insertStatement = "INSERT INTO Customers " + 
                                     "(CustFirstName, CustLastName, CustAddress, CustCity, " + 
                                     "CustProv, CustPostal, CustCountry, CustHomePhone, " +
                                     "CustBusPhone, CustEmail) " +
                                     "VALUES (@CustFirstName, @CustLastName, @CustAddress, " + 
                                     "@CustCity, @CustProv, @CustPostal, @CustCountry, " +
                                     "@CustHomePhone, @CustBusPhone, @CustEmail)";

            SqlCommand cmd = new SqlCommand(insertStatement, con);
            cmd.Parameters.AddWithValue("@CustFirstName", newCust.CustFirstName);
            cmd.Parameters.AddWithValue("@CustLastName", newCust.CustLastName);
            cmd.Parameters.AddWithValue("@CustAddress", newCust.CustAddress);
            cmd.Parameters.AddWithValue("@CustCity", newCust.CustCity);
            cmd.Parameters.AddWithValue("@CustProv", newCust.CustProv);
            cmd.Parameters.AddWithValue("@CustPostal", newCust.CustPostal);
            cmd.Parameters.AddWithValue("@CustCountry", newCust.CustCountry);
            cmd.Parameters.AddWithValue("@CustHomePhone", newCust.CustHomePhone);
            cmd.Parameters.AddWithValue("@CustBusPhone", newCust.CustBusPhone);
            cmd.Parameters.AddWithValue("@CustEmail", newCust.CustEmail);

            try
            {
                // Open the connection and run the insert command
                con.Open();
                cmd.ExecuteNonQuery(); 

                // Get the CustomerId (primary key) of the newly inserted customer record
                string selectQuery = "SELECT IDENT_CURRENT('Customers') FROM Customers";
                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                int newCustID = Convert.ToInt32(selectCmd.ExecuteScalar());

                return newCustID;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        // ----- Jason McIntyre ----
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int UpdateCustomer(Customer original_Customer,
        Customer customer)
        {
            int updateCount = 0;
            string sql = "UPDATE Customers "
                + "SET CustFirstName = @CustFirstName, "
                + "CustLastName = @CustLastName, "
                + "CustAddress = @CustAddress, "
                + "CustCity = @CustCity, "
                + "CustProv = @CustProv, "
                + "CustPostal = @CustPostal, "
                + "CustCountry = @CustCountry, "
                + "CustHomePhone = @CustHomePhone, "
                + "CustBusPhone = @CustBusPhone, "
                + "CustEmail = @CustEmail "
                + "WHERE CustomerID = @original_CustomerID "
                + "AND CustFirstName = @original_CustFirstName "
                + "AND CustLastName = @original_CustLastName "
                + "AND CustAddress = @original_CustAddress "
                + "AND CustCity = @original_CustCity "
                + "AND CustProv = @original_CustProv "
                + "AND CustPostal = @original_CustPostal "
                + "AND CustCountry = @original_CustCountry "
                + "AND CustHomePhone = @original_CustHomePhone "
                + "AND CustBusPhone = @original_CustBusPhone "
                + "AND CustEmail = @original_CustEmail";

            SqlConnection con = TravelExpertsDB.GetConnection();
           // {
               // using (SqlCommand cmd = new SqlCommand(sql, con))
                    SqlCommand cmd = new SqlCommand(sql, con);
                //{
                    cmd.Parameters.AddWithValue("@CustFirstName", customer.CustFirstName);
                    cmd.Parameters.AddWithValue("@CustLastName", customer.CustLastName);
                    cmd.Parameters.AddWithValue("@CustAddress", customer.CustAddress);
                    cmd.Parameters.AddWithValue("@CustCity", customer.CustCity);
                    cmd.Parameters.AddWithValue("@CustProv", customer.CustProv);
                    cmd.Parameters.AddWithValue("@CustPostal", customer.CustPostal);
                    cmd.Parameters.AddWithValue("@CustCountry", customer.CustCountry);
                    cmd.Parameters.AddWithValue("@CustHomePhone", customer.CustHomePhone);
                    cmd.Parameters.AddWithValue("@CustBusPhone", customer.CustBusPhone);
                    cmd.Parameters.AddWithValue("@CustEmail", customer.CustEmail);

                    cmd.Parameters.AddWithValue("@original_CustomerID",
                        original_Customer.CustomerId);

                    cmd.Parameters.AddWithValue("@original_CustFirstName",
                        original_Customer.CustFirstName);
                    cmd.Parameters.AddWithValue("@original_CustLastName",
                        original_Customer.CustLastName);
                    cmd.Parameters.AddWithValue("@original_CustAddress",
                        original_Customer.CustAddress);
                    cmd.Parameters.AddWithValue("@original_CustCity",
                        original_Customer.CustCity);
                    cmd.Parameters.AddWithValue("@original_CustProv",
                        original_Customer.CustProv);
                    cmd.Parameters.AddWithValue("@original_CustPostal",
                        original_Customer.CustPostal);
                    cmd.Parameters.AddWithValue("@original_CustCountry",
                        original_Customer.CustCountry);
                    cmd.Parameters.AddWithValue("@original_CustHomePhone",
                        original_Customer.CustHomePhone);
                    cmd.Parameters.AddWithValue("@original_CustBusPhone",
                        original_Customer.CustBusPhone);
                    cmd.Parameters.AddWithValue("@original_CustEmail",
                        original_Customer.CustEmail);
                                                  
               // }
                        
            try
            {
                // Open the connection and run the insert command
                con.Open();
               updateCount = cmd.ExecuteNonQuery();


                // Get the CustomerId (primary key) of the newly inserted customer record
                return updateCount;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
    }
}