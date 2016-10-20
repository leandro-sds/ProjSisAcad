using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class DisciplinaDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private string query;
        private SqlCommand cmd;

        public void Insert(Disciplina disc) {
            try {
                con.Open();
                query = @"INSERT INTO Disciplina (disc_Cod, disc_Nome, disc_Cred, disc_HoraObr, disc_Falta, disc_Tipo) 
                                                 VALUES (@codDisc, @nome, @cred, @hora, @falta";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codDisc", disc.disc_Cod);
                cmd.Parameters.AddWithValue("@nome", disc.disc_Nome);
                cmd.Parameters.AddWithValue("@cred", disc.disc_Cred);
                cmd.Parameters.AddWithValue("@hora", disc.disc_HoraObr);
                cmd.Parameters.AddWithValue("@falta", disc.disc_Falta);
                cmd.Parameters.AddWithValue("@tipo", disc.disc_Tipo);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao cadastrar disciplina.");
            }
            finally {
                con.Close();
            }
        }

        public void Update(Disciplina disc) {
            try {
                con.Open();
                query = @"UPDATE Cursos SET disc_Cod = @codDisc, disc_Nome = @nome, disc_Cred = @cred, disc_HoraObr = @hora,
                                        disc_falta = @falta, disc_Tipo = @tipo";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codDisc", disc.disc_Cod);
                cmd.Parameters.AddWithValue("@nome", disc.disc_Nome);
                cmd.Parameters.AddWithValue("@cred", disc.disc_Cred);
                cmd.Parameters.AddWithValue("@hora", disc.disc_HoraObr);
                cmd.Parameters.AddWithValue("@falta", disc.disc_Falta);
                cmd.Parameters.AddWithValue("@tipo", disc.disc_Tipo);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao atualizar disciplina.");
            }
            finally {
                con.Close();
            }
        }

        public void Delete(int codDisc) {
            try {
                con.Open();
                query = "DELETE * FROM Disciplina WHERE disc_Cod = @codDisc";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", codDisc);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao excluir disciplina.");
            }
            finally {
                con.Close();
            }
        }

        public List<Disciplina> Listar(string nome, string tipo) {
            try {
                con.Open();
                query = @"SELECT * FROM Disciplina WHERE
                        (@tipo IS NULL OR disc_Tipo = @tipo) AND 
                        (@nome is NULL or curso_Nome = @nome)";
                cmd.Parameters.AddWithValue("@prof", tipo);
                cmd.Parameters.AddWithValue("@nome", nome);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Disciplina> lista = new List<Disciplina>();
                Disciplina disc = new Disciplina();

                while (dr.Read()) {
                    disc.disc_Cod = Convert.ToInt32("curso_Cod");
                    disc.disc_Nome = Convert.ToString("disc_Nome");
                    disc.disc_Tipo = Convert.ToString("disc_Tipo");
                    disc.disc_HoraObr = Convert.ToInt32("disc_HoraObr");
                    disc.disc_Cred = Convert.ToInt32("disc_Cred");
                    disc.disc_Falta = Convert.ToInt32("disc_Falta");
                    lista.Add(disc);
                }
                return lista;
            }
            catch {
                throw new Exception("Erro ao listar disciplinas.");
            }
            finally {
                con.Close();
            }
        }
    }
}