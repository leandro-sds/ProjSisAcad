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
                con.Open();
                query = "INSERT INTO Cursos (curso_Cod, curso_Nome, curso_TotCred, curso_IdProf) VALUES (@codCurso, @nome, @totCred, @idProf)";
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

        public void Insert(Curso curso) {
            try {
                con.Open();
                query = "INSERT INTO Cursos (curso_Nome, curso_TotCred, curso_IdProf) VALUES (@nome, @totCred, @idProf)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@nome", curso.curso_Nome);
                cmd.Parameters.AddWithValue("@totCred", curso.curso_TotCred);
                cmd.Parameters.AddWithValue("@idProf", Convert.ToInt16(curso.curso_IdProf));
                cmd.ExecuteNonQuery();
            }
            catch (Exception erro) {
                throw new Exception("erro" + erro.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Update(Curso curso) {
            try {
                con.Open();
                query = "UPDATE Cursos SET curso_Nome = @nome, curso_TotCred = @totCred, curso_IdProf = @idProf WHERE curso_Cod = @codCurso";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", curso.curso_Cod);
                cmd.Parameters.AddWithValue("@nome", curso.curso_Nome);
                cmd.Parameters.AddWithValue("@totCred", curso.curso_TotCred);
                cmd.Parameters.AddWithValue("@idProf", curso.curso_IdProf);           
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Delete(Curso curso) {
            try {
                con.Open();
                query = "DELETE FROM Cursos WHERE curso_Cod = @codCurso";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", curso.curso_Cod);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public Curso GetCurso(int cod) {
            try {
                con.Open();
                query = "SELECT * FROM Cursos WHERE curso_Cod = @cod";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@cod", cod);
                SqlDataReader dr = cmd.ExecuteReader();
                Curso curso = new Curso();
                
                if (dr.Read()) {
                    curso.curso_Cod = Convert.ToInt32(dr["curso_Cod"].ToString());
                    curso.curso_IdProf = Convert.ToInt32(dr["curso_IdProf"].ToString());
                    curso.curso_Nome = dr["curso_Nome"].ToString();
                    curso.curso_TotCred = Convert.ToInt32(dr["curso_TotCred"].ToString());
                }
                return curso;
            }
            catch (Exception e) {
                throw new Exception("Erro ao listar alunos." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Curso> Listar() {
            try {
                con.Open();
                query = @"SELECT * FROM Cursos";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Curso> lista = new List<Curso>();
               
                while (dr.Read()) {
                    Curso curso = new Curso();
                    curso.curso_Cod = Convert.ToInt32(dr["curso_Cod"]);
                    curso.curso_IdProf = Convert.ToInt32(dr["curso_IdProf"]);
                    curso.curso_Nome = dr["curso_Nome"].ToString();
                    curso.curso_TotCred = Convert.ToInt32(dr["curso_TotCred"]);
                    lista.Add(curso);
                }
                return lista;
            }
            catch (Exception e) {
                throw new Exception("Erro ao listar alunos. " + e.Message);

            }
            finally {
                con.Close();
            }
        }
    }
}