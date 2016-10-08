using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class CursoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private string query;
        private SqlCommand cmd;

        public void Insert(Curso curso, int idProf) {
            try {
                query = "INSERT INTO Cursos (curso_Cod, curso_Nome, curso_TotCred, curso_IdProf) VALUES (@codCurso, @nome, @totCred, @idProf";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", curso.curso_Cod);
                cmd.Parameters.AddWithValue("@nome", curso.curso_Nome);
                cmd.Parameters.AddWithValue("@totCred", curso.curso_TotCred);
                cmd.Parameters.AddWithValue("@idProf", idProf);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao cadastrar curso.");
            }
            finally {
                con.Close();
            }
        }

        public void Update(Curso curso, int idProf) {
            try {
                query = "UPDATE Cursos SET curso_cod = @codCurso, curso_Nome = @nome, curso_TotCred = @totCred, curso_IdProf = @idProf";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", curso.curso_Cod);
                cmd.Parameters.AddWithValue("@nome", curso.curso_Nome);
                cmd.Parameters.AddWithValue("@totCred", curso.curso_TotCred);
                cmd.Parameters.AddWithValue("@idProf", idProf);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro");
            }
            finally {
                con.Close();
            }
        }

        public void Delete(int codCurso) {
            try {
                query = "DELETE * FROM Cursos WHERE curso_Cod = @codCurso";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", codCurso);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro");
            }
            finally {
                con.Close();
            }
        }

        public List<Curso> List(int prof, string nome) {
            try {
                query = @"SELECT * FROM Cursos WHERE
                        (@prof = 0 OR curso_IdProf = @prof) AND 
                        (@nome is NULL or curso_Nome = @nome)";
                cmd.Parameters.AddWithValue("@prof", prof);
                cmd.Parameters.AddWithValue("@nome", nome);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Curso> lista = new List<Curso>();
                Curso curso = new Curso();
                
                while(dr.Read()) {
                    curso.curso_Cod = Convert.ToInt32("curso_Cod");
                    curso.curso_IdProf = Convert.ToInt32("curso_IdProf");
                    curso.curso_Nome = Convert.ToString("curso_Nome");
                    curso.curso_TotCred = Convert.ToInt32("curso_TotCred");

                }
            }
            catch {

            }
            finally {

            }
        }
    }
}