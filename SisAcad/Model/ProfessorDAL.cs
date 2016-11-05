using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class ProfessorDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private string query;
        private SqlCommand cmd;

        public void Insert(Professor prof) {
            string mat = "20160";
            try {
                con.Open();
                query = "INSERT INTO Professor (prof_Mat, prof_Nome) VALUES (@mat, @nome)";
                cmd = new SqlCommand(query, con);
                
                SqlCommand getTotal = new SqlCommand("SELECT COUNT(*) FROM Professor", con);
                string total = Convert.ToString(getTotal.ExecuteScalar());
                mat += total;

                cmd.Parameters.AddWithValue("@mat", mat);
                cmd.Parameters.AddWithValue("@nome", prof.prof_Nome);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao cadastrar professor " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Update(Professor prof) {
            try {
                con.Open();
                query = "UPDATE Professor SET prof_Nome = @nome WHERE prof_Mat = @mat";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@nome", prof.prof_Nome);
                cmd.Parameters.AddWithValue("@mat", prof.prof_Mat);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao atualizar professor" + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Delete(Professor prof) {
            try {
                con.Open();
                query = "DELETE FROM Professor WHERE prof_mat = @mat";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", prof.prof_Mat);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao deletar professor " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public Professor GetProf(int id) {
            try {
                con.Open();
                query = "SELECT * FROM Professor WHERE prof_Id = @id";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id",id);
                SqlDataReader dr = cmd.ExecuteReader();
                Professor prof = new Professor();

                if (dr.Read()) {
                    prof.prof_Mat = dr["prof_Mat"].ToString();
                    prof.prof_Nome = dr["prof_Nome"].ToString();
                }
                return prof;
            }
            catch (Exception e) {
                throw new Exception("Erro ao listar professores." + e.Message);

            }
            finally {
                con.Close();
            }
        }

        public List<Professor> Listar() {
            List<Professor> lista = new List<Professor>();
            try {
                con.Open();
                cmd = new SqlCommand("SELECT * FROM Professor", con);
                SqlDataReader dr = cmd.ExecuteReader();
               
                

                while (dr.Read()) {
                    Professor prof = new Professor();
                    prof.prof_Mat = dr["prof_Mat"].ToString();
                    prof.prof_Nome = dr["prof_Nome"].ToString();
                    prof.prof_Id = dr["prof_Id"].ToString();
                    lista.Add(prof);
                }
                
            }
            catch (Exception erro) {
                throw new Exception("erro " + erro.Message);
            }
            finally {
                con.Close();
            }
            return lista;
        }

        public Professor Obter(int idProf) {
            try
            {
                con.Open();
                cmd = new SqlCommand("SELECT prof_Nome FROM Professor WHERE prof_Id = @id ", con);
                cmd.Parameters.AddWithValue("@id", idProf);
                SqlDataReader dr = cmd.ExecuteReader();
                Professor prof = new Professor();
                if (dr.Read())
                {
                
                prof.prof_Nome = dr["prof_Nome"].ToString();

                }
                return prof;



            }
            catch (Exception e)
            {
                throw new Exception("erro." + e.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}