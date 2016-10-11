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
            try {
                con.Open();
                query = "INSERT INTO Professor (prof_Mat, prof_Nome) VALUES (@mat, @nome)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", prof.prof_Mat);
                cmd.Parameters.AddWithValue("@nome", prof.prof_Nome);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao cadastrar professor.");
            }
            finally {
                con.Close();
            }
        }

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

        public void Delete(int matProf) {
            try {
                con.Open();
                query = "DELETE * FROM Professor WHERE prof_mat = @mat";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", matProf);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao deletar professor");
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
    }
}