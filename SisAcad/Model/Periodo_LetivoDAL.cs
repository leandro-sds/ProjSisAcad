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

                if()

                cmd.Parameters.AddWithValue("@prof", prof);
                cmd.Parameters.AddWithValue("@nome", nome);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Curso> lista = new List<Curso>();
                Curso curso = new Curso();

                while (dr.Read()) {
                    curso.curso_Cod = Convert.ToInt32(dr["curso_Cod"].ToString());
                    curso.curso_IdProf = Convert.ToInt32(dr["curso_IdProf"].ToString());
                    curso.curso_Nome = dr["curso_Nome"].ToString();
                    curso.curso_TotCred = Convert.ToInt32(dr["curso_TotCred"].ToString();
                    lista.Add(curso);
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