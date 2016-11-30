using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class MatriculaDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Matricula mat) {
            try {
                con.Open();
                query = "INSERT INTO Matriculas (matricula_Ano, matricula_Semestre, matricula_CodAluno, matricula_CodDisc) VALUES (@ano, @semestre, @alunoMat, @codDisc)";
                cmd = new SqlCommand(query, con);

                string[] separator = { "." };
                string[] semestre = mat.matricula_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@alunoMat", mat.matricula_CodAluno);
                cmd.Parameters.AddWithValue("@codDisc", mat.matricula_CodDisc);
                cmd.ExecuteNonQuery();

                Historico hist = new Historico(semestre[0].ToString(), semestre[1].ToString(), mat.matricula_CodDisc, mat.matricula_CodAluno);

                HistoricoDAL histDAL = new HistoricoDAL();
                histDAL.Insert(hist);
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void Update(Matricula mat) {
            try {
                con.Open();
                query = @"UPDATE Matriculas SET matricula_Ano, = @ano, mastricula_Semestre = @semestre, matricula_CodAluno = @matAluno, matricula_CodCurso = @codCurso
                                                matricula_N1 = @n1, matricula_N2 = @n2, matricula_N3 = @n3, matricula_F1 = @f1, matricula_F2 = @f2, matricula_F3 = @f3";
                cmd = new SqlCommand(query, con);

                string[] separator = { "." };
                string[] semestre = mat.matricula_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@alunoMat", mat.matricula_CodAluno);
                cmd.Parameters.AddWithValue("@codCurso", mat.matricula_CodDisc);
                cmd.Parameters.AddWithValue("@n1", mat.matricula_N1);
                cmd.Parameters.AddWithValue("@n2", mat.matricula_N2);
                cmd.Parameters.AddWithValue("@n3", mat.matricula_N3);
                cmd.Parameters.AddWithValue("@f1", mat.matricula_F1);
                cmd.Parameters.AddWithValue("@f2", mat.matricula_F2);
                cmd.Parameters.AddWithValue("@f3", mat.matricula_F3);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Matricula> Listar() {
            try {
                con.Open();
                cmd = new SqlCommand("SELECT * FROM Matriculas", con);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Matricula> lista = new List<Matricula>();

                while (dr.Read()) {
                    Matricula mat = new Matricula();
                    mat.matricula_Semestre = dr["mat_Ano"].ToString() + "." + dr["mat_Semestre"].ToString();
                    mat.matricula_CodAluno = Convert.ToInt32(dr["mat_CodAluno"].ToString());
                    mat.matricula_CodDisc = Convert.ToInt32(dr["mat_CodDisc"].ToString());
                    mat.matricula_N1 = Convert.ToInt32(dr["mat_N1"].ToString());
                    mat.matricula_N2 = Convert.ToInt32(dr["mat_N2"].ToString());
                    mat.matricula_N3 = Convert.ToInt32(dr["mat_N3"].ToString());
                    mat.matricula_F1 = Convert.ToInt32(dr["mat_F1"].ToString());
                    mat.matricula_F2 = Convert.ToInt32(dr["mat_F2"].ToString());
                    mat.matricula_F3 = Convert.ToInt32(dr["mat_F3"].ToString());
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