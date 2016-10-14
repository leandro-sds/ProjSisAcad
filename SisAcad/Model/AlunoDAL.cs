using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class AlunoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        //Falta implementar a conexão

        private SqlCommand cmd;
        String query;

        public void Insert(Aluno aluno) {
            try {
                con.Open();
                query = @"INSERT INTO Aluno (aluno_Mat, aluno_Nome, aluno_TotCred, aluno_DataNasc, aluno_MGP, aluno_CodCurso) 
                                        VALUES (@mat, @nome, @totalCred, @dataNasc, @mgp, @codCurso)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", aluno.aluno_Mat);
                cmd.Parameters.AddWithValue("@nome", aluno.aluno_Nome);
                cmd.Parameters.AddWithValue("@totalCred", aluno.aluno_TotCred);
                cmd.Parameters.AddWithValue("@dataNasc", aluno.aluno_DataNasc);
                cmd.Parameters.AddWithValue("@mgp", aluno.aluno_MGP);
                cmd.Parameters.AddWithValue("@codCurso", aluno.aluno_CodCurso);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao cadastrar aluno.");
            }
            finally {
                con.Close();
            }

        }

        public void Delete(Aluno aluno) {
            try {
                con.Open();
                query = "DELETE FROM Aluno WHERE aluno_Mat = @mat";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", aluno.aluno_Mat);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao excluir aluno.");
            }
            finally {
                con.Close();
            }

        }

        public void Update(Aluno aluno) {
            try {
                con.Open();
                query = @"UPDATE Aluno SET aluno_Mat = @mat, aluno_Nome = @nome, aluno_TotCred = @totalCred, aluno_DataNasc = @dataNasc, aluno_MGP = @mgp, 
                                           aluno_CodCurso = @codCurso";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", aluno.aluno_Mat);
                cmd.Parameters.AddWithValue("@nome", aluno.aluno_Nome);
                cmd.Parameters.AddWithValue("@totalCred", aluno.aluno_TotCred);
                cmd.Parameters.AddWithValue("@dataNasc", aluno.aluno_DataNasc);
                cmd.Parameters.AddWithValue("@mgp", aluno.aluno_MGP);
                cmd.Parameters.AddWithValue("@codCurso", aluno.aluno_CodCurso);
                cmd.ExecuteNonQuery();
            }
            catch {
                throw new Exception("Erro ao atualizar aluno.");
            }
            finally {
                con.Close();
            }

        }

        public List<Aluno> Listar(string nome, string mat, string codCurso) {
            try {
                con.Open();
                cmd = new SqlCommand(@"SELECT * 
                                        FROM Aluno 
                                        WHERE (@mat is null or aluno_Mat = @mat) AND 
                                        (@nome is NULL or aluno_Nome = @nome) AND
                                        (@codCurso is NULL or aluno_CodCurso = @codCurso)", con);
                /*cmd.Parameters.AddWithValue("@mat", mat);
                cmd.Parameters.AddWithValue("@nome", nome);
                cmd.Parameters.AddWithValue("@codCurso", codCurso);*/
                SqlDataReader dr = cmd.ExecuteReader();
                List<Aluno> lista = new List<Aluno>();
                Aluno aluno = new Aluno();

                while (dr.Read()) {
                    aluno.aluno_Mat = Convert.ToInt16("aluno_Mat");
                    aluno.aluno_Nome = Convert.ToString("aluno_Nome");
                    aluno.aluno_DataNasc = Convert.ToDateTime("aluno_DataNasc");
                    aluno.aluno_MGP = Convert.ToDecimal("aluno_MGP");
                    aluno.aluno_TotCred = Convert.ToInt16("aluno_TotCred");
                    aluno.aluno_CodCurso = Convert.ToInt16("aluno_CodCurso");
                    lista.Add(aluno);
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

        public List<Aluno> Listar() {
            try {
                con.Open();
                cmd = new SqlCommand(@"SELECT * FROM Aluno", con);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Aluno> lista = new List<Aluno>();
                Aluno aluno = new Aluno();

                while (dr.Read()) {
                    aluno.aluno_Mat = Convert.ToInt16("aluno_Mat");
                    aluno.aluno_Nome = Convert.ToString("aluno_Nome");
                    aluno.aluno_DataNasc = Convert.ToDateTime("aluno_DataNasc");
                    aluno.aluno_MGP = Convert.ToDecimal("aluno_MGP");
                    aluno.aluno_TotCred = Convert.ToInt16("aluno_TotCred");
                    aluno.aluno_CodCurso = Convert.ToInt16("aluno_CodCurso");
                    lista.Add(aluno);
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