using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Periodo_LetivoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private string query;
        private SqlCommand cmd;

        public void Insert(Periodo_Letivo pl) {
            try {
                con.Open();
                query = "INSERT INTO Periodo_Letivo (pl_Ano, pl_Semestre, pl_DtInicio, pl_DtFim) VALUES (@ano, @semestre, @dtini, @dtfim)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ano", pl.pl_Ano);
                cmd.Parameters.AddWithValue("@semestre", pl.pl_Semestre);
                cmd.Parameters.AddWithValue("@dtini", pl.pl_DtInicio);
                cmd.Parameters.AddWithValue("@dtfim", pl.pl_DtFim);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao cadastrar periodo letivo." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Update(Periodo_Letivo pl) {
            try {
                con.Open();
                query = "UPDATE Periodo_Letivo SET pl_Ano = @ano, pl_Semestre = @semestre, pl_DtInicio = @dtini, pl_DtFim = @dtfim";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ano", pl.pl_Ano);
                cmd.Parameters.AddWithValue("@semestre", pl.pl_Semestre);
                cmd.Parameters.AddWithValue("@dtini", pl.pl_DtInicio);
                cmd.Parameters.AddWithValue("@dtfim", pl.pl_DtFim);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao atualizar periodo letivo");
            }
            finally {
                con.Close();
            }
        }

        public void Delete(int id) {
            try {
                con.Open();
                query = "DELETE FROM Periodo_Letivo WHERE pl_Id = @id";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao deletar periodo letivo");
            }
            finally {
                con.Close();
            }
        }

        public List<Periodo_Letivo> Listar(string ano, string semestre, string dtinicio, string dtfim) {
            try {
                con.Open();
                query = @"SELECT * FROM Periodo_Letivo WHERE
                        (@ano IS NULL OR @ano = pl_Ano) AND 
                        (@semestre IS NULL OR @semestre = pl_Semestre) AND
                        (@dtinicio IS NULL OR @dtinicio = pl_DtInicio) AND
                        (@dtfim IS NULL OR @dtfim = pl_DtFim)";
                cmd = new SqlCommand(query, con);

                if (string.IsNullOrEmpty(dtinicio)) {
                    cmd.Parameters.AddWithValue("@dtinicio", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@dtinicio", dtinicio);
                }

                if (string.IsNullOrEmpty(dtfim)) {
                    cmd.Parameters.AddWithValue("@dtfim", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@dtfim", dtfim);
                }

                if (string.IsNullOrEmpty(ano) | string.IsNullOrEmpty(semestre)) {
                    cmd.Parameters.AddWithValue("@ano", DBNull.Value);
                    cmd.Parameters.AddWithValue("@semestre", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@semestre", semestre);
                    cmd.Parameters.AddWithValue("@ano", ano);
                }

                SqlDataReader dr = cmd.ExecuteReader();
                List<Periodo_Letivo> lista = new List<Periodo_Letivo>();
                
                while (dr.Read()) {
                    Periodo_Letivo pl = new Periodo_Letivo();
                    pl.pl_Semestre = dr["pl_Ano"].ToString() + "." + dr["pl_Semestre"].ToString();
                    pl.pl_DtInicio = dr["pl_DtInicio"].ToString();
                    pl.pl_DtFim = dr["pl_DtFim"].ToString();
                    lista.Add(pl);
                }
                return lista;
            }
            catch (Exception e) {
                throw new Exception("Erro ao listar alunos." + e.Message);

            }
            finally {
                con.Close();
            }
        }
    }
}