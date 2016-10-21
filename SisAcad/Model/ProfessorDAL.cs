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
            int mat = 2016;
            try {
                con.Open();
                query = "INSERT INTO Professor (prof_Mat, prof_Nome) VALUES (@mat, @nome)";
                cmd = new SqlCommand(query, con);
                
                SqlCommand getTotal = new SqlCommand("SELECT COUNT(*) FROM Professor", con);
                int total = Convert.ToInt32(getTotal.ExecuteScalar());

                cmd.Parameters.AddWithValue("@mat", mat + total);
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

        /*private int getTotal() {
            query = "SELECT COUNT(*) FROM Professor";
            cmd = new SqlCommand(query, con);
            int total = Convert.ToInt32(cmd.ExecuteScalar());
            return total;
            
        }*/

        public void Update(Professor prof) {
            try {
                con.Open();
                query = "UPDATE Professor SET prof_Nome = @nome";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@nome", prof.prof_Nome);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao atualizar professor");
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

        public List<Professor> Listar(string mat, string nome) {
            try {
                con.Open();
                query = @"SELECT * FROM Cursos WHERE
                        (@mat IS NULL OR prof_Mat = @mat) AND 
                        (@nome is NULL or curso_Nome = @nome)";
                cmd.Parameters.AddWithValue("@mat", mat);
                cmd.Parameters.AddWithValue("@nome", nome);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Professor> lista = new List<Professor>();
                Professor prof = new Professor();

                while (dr.Read()) {
                    prof.prof_Mat = Convert.ToString("prof_Mat");
                    prof.prof_Nome = Convert.ToString("prof_Nome");
                    lista.Add(prof);
                }
                return lista;
            }
            catch {
                throw new Exception("Erro ao listar professores.");

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








    }
}