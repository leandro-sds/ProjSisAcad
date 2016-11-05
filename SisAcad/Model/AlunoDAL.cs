using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class AlunoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Aluno aluno) {
            string mat = "20160";
            try {
                con.Open();
                query = @"INSERT INTO Aluno (aluno_Mat, aluno_Nome, aluno_TotCred, aluno_DataNasc, aluno_MGP, aluno_CodCurso, aluno_sexo) 
                                        VALUES (@mat, @nome, @totalCred, @dataNasc, @mgp, @codCurso, @sexo)";

                SqlCommand getTotal = new SqlCommand("SELECT COUNT(*) FROM Aluno", con);
                string total = Convert.ToString(getTotal.ExecuteScalar());
                mat += total;


                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", Convert.ToInt32(mat));
                cmd.Parameters.AddWithValue("@nome", aluno.aluno_Nome);
                cmd.Parameters.AddWithValue("@totalCred", 24);
                cmd.Parameters.AddWithValue("@dataNasc", aluno.aluno_DataNasc);
                cmd.Parameters.AddWithValue("@mgp", 0);
                cmd.Parameters.AddWithValue("@codCurso", aluno.aluno_CodCurso);
                cmd.Parameters.AddWithValue("@sexo", aluno.aluno_Sexo);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao cadastrar aluno. " + e.Message);
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
            catch (Exception e) {
                throw new Exception("Erro ao excluir aluno." + e.Message);
            }
            finally {
                con.Close();
            }

        }

        public void Update(Aluno aluno) {
            try {
                con.Open();
                query = @"UPDATE Aluno SET aluno_Nome = @nome, aluno_TotCred = @totalCred, aluno_DataNasc = @dataNasc, 
                                           aluno_CodCurso = @codCurso, aluno_Sexo = @sexo WHERE aluno_mat = @mat";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mat", aluno.aluno_Mat);
                cmd.Parameters.AddWithValue("@nome", aluno.aluno_Nome);
                cmd.Parameters.AddWithValue("@totalCred", aluno.aluno_TotCred);
                cmd.Parameters.AddWithValue("@dataNasc", aluno.aluno_DataNasc);
                cmd.Parameters.AddWithValue("@codCurso", aluno.aluno_CodCurso);
                cmd.Parameters.AddWithValue("@sexo", aluno.aluno_Sexo);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro ao atualizar aluno." + e.Message);
            }
            finally {
                con.Close();
            }

        }

        public Aluno GetAluno(int id) {
            try {
                con.Open();
                cmd = new SqlCommand(@"SELECT * FROM Aluno WHERE Id = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                Aluno al = new Aluno();

                if (dr.Read()) {
                    al.Id = Convert.ToInt32(dr["Id"].ToString());
                    al.aluno_Mat = Convert.ToInt32(dr["aluno_Mat"].ToString());
                    al.aluno_Nome = dr["aluno_Nome"].ToString();
                    al.aluno_DataNasc = dr["aluno_DataNasc"].ToString();
                    al.aluno_MGP = Convert.ToDecimal(dr["aluno_MGP"].ToString());
                    al.aluno_TotCred = Convert.ToInt16(dr["aluno_TotCred"].ToString());
                    al.aluno_CodCurso = Convert.ToInt16(dr["aluno_CodCurso"].ToString());
                }
                return al;
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
               

                while (dr.Read()) {
                    Aluno aluno = new Aluno();
                    aluno.Id = Convert.ToInt32(dr["Id"].ToString());
                    aluno.aluno_Mat = Convert.ToInt32(dr["aluno_Mat"].ToString());
                    aluno.aluno_Nome = dr["aluno_Nome"].ToString();
                    aluno.aluno_DataNasc = dr["aluno_DataNasc"].ToString();
                    aluno.aluno_MGP = Convert.ToDecimal(dr["aluno_MGP"].ToString());
                    aluno.aluno_TotCred = Convert.ToInt16(dr["aluno_TotCred"].ToString());
                    aluno.aluno_CodCurso = Convert.ToInt16(dr["aluno_CodCurso"].ToString());
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