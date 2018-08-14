/*
 * Travel Experts Workshop 5
 * Customer.cs
 * Author:  Corinne Mullan
 * Date:    July 24, 2018
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWeb.App_Code
{
    public class Customer
    {
        // Public accessor properties
        public int CustomerId { get; set; }
        public string CustFirstName { get; set; }
        public string CustLastName { get; set; }
        public string CustAddress { get; set; }
        public string CustCity { get; set; }
        public string CustProv { get; set; }
        public string CustPostal { get; set; }
        public string CustCountry { get; set; }
        public string CustHomePhone { get; set; }
        public string CustBusPhone { get; set; }
        public string CustEmail { get; set; }

        // Default constructor
        public Customer() { }
    }
}