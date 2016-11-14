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
                query = "INSERT INTO Periodo_Letivo (pl_Ano, pl_Semestre, pl_DtInicio, pl_DtFim) VALUES (@ano, @semestre, @dtini, @dtfim";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ano", pl.pl_Ano);
                cmd.Parameters.AddWithValue("@semestre", pl.pl_Semestre);
                cmd.Parameters.AddWithValue("@dtini", pl.pl_DtInicio);
                cmd.Parameters.AddWithValue("@dtfim", pl.pl_DtFim);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao cadastrar periodo letivo.");
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

        public List<Curso> Listar(int ano, int semestre, string dtinicio, string dtfim) {
            try {
                con.Open();
                query = @"SELECT * FROM Periodo_Letivo WHERE
                        (@pl_Ano IS NULL OR @pl_Ano = pl_Ano) AND 
                        (@pl_Semestre IS NULL OR @pl_Semestre = pl_Semestre) AND
                        (@pl_DtInicio IS NULL OR @pl_DtInicio = DtInicio) AND
                        (@pl_DtFim IS NULLS OR @pl_DtFim = DtFim)";
                cmd = new SqlCommand(query, con);

                if (string.IsNullOrEmpty(dtinicio)) {
                    cmd.Parameters.AddWithValue("@pl_Dtinicio", dtinicio);
                } else {
                    cmd.Parameters.AddWithValue("@pl_DtFim", dtfim);
                }

                if ()

                
                SqlDataReader dr = cmd.ExecuteReader();
                Periodo_Letivo pl = new Periodo_Letivo(); 

                while (dr.Read()) {
                    List<Curso> lista = new List<Curso>();
                    String.Join(".")
                }
                return lista;
            }
            catch {
                throw new Exception("Erro ao listar alunos.");

            }
            finally {
                con.Close();
            }
        }
    }
}