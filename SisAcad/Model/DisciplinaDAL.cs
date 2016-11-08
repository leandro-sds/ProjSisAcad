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
                query = @"INSERT INTO Disciplina (disc_Nome, disc_Cred, disc_HoraObr, disc_Falta, disc_Tipo) 
                                                 VALUES (@nome, @cred, @hora, @falta, @tipo)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@nome", disc.disc_Nome);
                cmd.Parameters.AddWithValue("@cred", disc.disc_Cred);
                cmd.Parameters.AddWithValue("@hora", disc.disc_HoraObr);
                cmd.Parameters.AddWithValue("@falta", disc.disc_Falta);
                cmd.Parameters.AddWithValue("@tipo", disc.disc_Tipo);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao cadastrar disciplina." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Update(Disciplina disc) {
            try {
                con.Open();
                query = @"UPDATE Disciplina SET disc_Nome = @nome, disc_Cred = @cred, disc_HoraObr = @hora,
                                        disc_falta = @falta, disc_Tipo = @tipo WHERE disc_Cod = @codDisc";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codDisc", disc.disc_Cod);
                cmd.Parameters.AddWithValue("@nome", disc.disc_Nome);
                cmd.Parameters.AddWithValue("@cred", disc.disc_Cred);
                cmd.Parameters.AddWithValue("@hora", disc.disc_HoraObr);
                cmd.Parameters.AddWithValue("@falta", disc.disc_Falta);
                cmd.Parameters.AddWithValue("@tipo", disc.disc_Tipo);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao atualizar disciplina." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Delete(Disciplina disc) {
            try {
                con.Open();
                query = "DELETE FROM Disciplina WHERE disc_Cod = @codDisc";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@codCurso", disc.disc_Cod);
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
                          (@nome IS NULL OR disc_Nome = @nome) AND
                          (@tipo IS NULL OR disc_Tipo = @tipo)";
                cmd = new SqlCommand(query, con);
                if (String.IsNullOrEmpty(nome))
                {
                    cmd.Parameters.AddWithValue("@nome", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@nome", nome);
                }

                if (String.IsNullOrEmpty(tipo))
                {
                    cmd.Parameters.AddWithValue("@tipo", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@tipo", tipo);
                }
                
                SqlDataReader dr = cmd.ExecuteReader();
                List<Disciplina> lista = new List<Disciplina>();

                while (dr.Read()) {
                    Disciplina disc = new Disciplina();
                    disc.disc_Cod = Convert.ToInt32(dr["disc_Cod"].ToString());
                    disc.disc_Nome = dr["disc_Nome"].ToString();
                    disc.disc_Tipo = dr["disc_Tipo"].ToString();
                    disc.disc_HoraObr = Convert.ToInt32(dr["disc_HoraObr"].ToString());
                    disc.disc_Cred = Convert.ToInt32(dr["disc_Cred"].ToString());
                    disc.disc_Falta = Convert.ToInt32(dr["disc_Falta"].ToString());
                    lista.Add(disc);
                }
                return lista;
            }
            catch (Exception e) {
                throw new Exception("Erro ao listar disciplinas." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Disciplina> Relatorio()
        {
            try
            {
                con.Open();
                query = @"SELECT * FROM Disciplina";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Disciplina> lista = new List<Disciplina>();

                while (dr.Read())
                {
                    Disciplina disc = new Disciplina();
                    disc.disc_Cod = Convert.ToInt32(dr["disc_Cod"].ToString());
                    disc.disc_Nome = dr["disc_Nome"].ToString();
                    disc.disc_Tipo = dr["disc_Tipo"].ToString();
                    disc.disc_HoraObr = Convert.ToInt32(dr["disc_HoraObr"].ToString());
                    disc.disc_Cred = Convert.ToInt32(dr["disc_Cred"].ToString());
                    disc.disc_Falta = Convert.ToInt32(dr["disc_Falta"].ToString());
                    lista.Add(disc);
                }
                return lista;
            }
            catch (Exception e)
            {
                throw new Exception("Erro ao listar disciplinas." + e.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public Disciplina GetDisc(int cod) {
            try {
                con.Open();
                query = "SELECT * FROM Disciplina WHERE disc_Cod = @cod";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@cod", cod);
                SqlDataReader dr = cmd.ExecuteReader();
                Disciplina disc = new Disciplina();

                if (dr.Read()) {
                    disc.disc_Nome = dr["disc_Nome"].ToString();
                    disc.disc_Cod = Convert.ToInt32(dr["disc_Cod"].ToString());
                    disc.disc_Falta = Convert.ToInt32(dr["disc_Falta"].ToString());
                    disc.disc_Tipo = dr["disc_Tipo"].ToString();
                    disc.disc_HoraObr = Convert.ToInt32(dr["disc_HoraObr"].ToString());
                    disc.disc_Cred = Convert.ToInt32(dr["disc_Cred"].ToString());
                }
                
                return disc;
            }
            catch (Exception e) {
                throw new Exception("erro." + e.Message);
            }
            finally {
                con.Close();
            }
        }
    }
}