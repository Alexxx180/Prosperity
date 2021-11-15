using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Prosperity.Server
{
    public class SQL
    {
        public SQL()
        {
            Con = Connect();
        }
        private SqlConnection Connect()
        {
            return new SqlConnection("Data Source=SASHA;Initial Catalog=User_10;Integrated Security=True");
        }
        private List<List<string>> Query()
        {
            List<List<string>> table = new List<List<string>>();
            Cmd.Connection.Open();
            Rdr = Cmd.ExecuteReader();
            if (Rdr.HasRows)
                while (Rdr.Read())
                {
                    List<string> row = new List<string>();
                    for (int i = 0; i < Rdr.FieldCount; i++)
                        row.Add(Rdr[i].ToString());
                    table.Add(row);
                }
            Cmd.Connection.Close();
            return table;
        }
        private void NQuery()
        {
            Cmd.Connection.Open();
            Cmd.ExecuteNonQuery();
            Cmd.Connection.Close();
        }
        private DataTable Table()
        {
            DataTable dt = new();
            Cmd.Connection.Open();
            Adp = new SqlDataAdapter(Cmd);
            Adp.Fill(dt);
            Cmd.Connection.Close();
            return dt;
        }
        private void Text(string query)
        {
            Cmd = new SqlCommand(query, Con);
            Cmd.CommandType = CommandType.Text;
        }
        public DataView Clients()
        {
            Text("SELECT * FROM Clients");
            Flt = All = Src = Table();
            return Flt.DefaultView;
        }
        public DataView TOP(string cnt)
        {
            Text("SELECT TOP("+ cnt + ") * FROM Clients");
            Flt = All = Table();
            return Flt.DefaultView;
        }
        public DataView Bdate()
        {
            Text("SELECT * FROM Clients WHERE MONTH(GETDATE()) = MONTH(Bdate)");
            Flt = All = Table();
            return Flt.DefaultView;
        }
        public DataView Filters(string filter,string sort)
        {
            Flt = All.Clone();
            DataRow[] rows = All.Select(filter, sort);
            foreach (DataRow row in rows)
                Flt.ImportRow(row);
            return Flt.DefaultView;
        }
        public void Delete(string id)
        {
            Text("DELETE FROM Clients WHERE ID="+id);
            NQuery();
        }
        public void Update(string id, string surname, string name, string middle, string sex, string phone, string email, string bdate, string photo, string tags)
        {
            Text("UPDATE Clients SET Surname='"+surname+"', Name='"+name+"', Middle='"+middle+"', Sex="+sex+", Phone='"+phone+"', Email='"+email+"', Bdate='"+bdate+"', Rdate=GETDATE(), Photo='"+photo+"', Tags='"+tags+"' WHERE ID=" + id);
            NQuery();
        }
        public void Insert(string surname, string name, string middle, string sex, string phone, string email, string bdate, string photo, string tags)
        {
            Text("INSERT INTO Clients(Surname, Name, Middle, Sex, Phone, Email, Bdate, Rdate, Photo, Tags) VALUES ('" + surname + "','" + name + "','" + middle + "'," + sex + ",'" + phone + "','" + email + "','" + bdate + "',GETDATE(),'" + photo + "','" + tags + "')");
            NQuery();
        }
        public List<List<String>> Summary(string id)
        {
            Text("SELECT Services.Name, Offers.Date FROM Offers LEFT JOIN Services ON Offers.Service = Services.ID WHERE Client="+id);
            return Query();
        }
        private SqlConnection Con;
        private SqlCommand Cmd;
        private SqlDataReader Rdr;
        private SqlDataAdapter Adp;
        public DataTable Src;
        public DataTable All;
        public DataTable Flt;
    }

}