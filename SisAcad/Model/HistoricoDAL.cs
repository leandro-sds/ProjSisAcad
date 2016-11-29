using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class HistoricoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Historico hist) {
            try {
                con.Open();
                query = @"INSERT INTO Historicos (hist_Ano, hist_Semestre, hist_DiscCod, hist_MatAluno) 
                                        VALUES (@ano, @semestre, @discCod, @matAluno)";

                string[] separator = { "." };
                string[] semestre = hist.hist_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@discCod", hist.hist_DiscCod);
                cmd.Parameters.AddWithValue("@matAluno", hist.hist_MatAluno);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao cadastrar aluno. " + e.Message);
            }
            finally {
                con.Close();
            }

        }
    }
}