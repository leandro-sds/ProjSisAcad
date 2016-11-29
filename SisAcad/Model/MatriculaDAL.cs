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
                query = "INSERT INTO Matriculas (matricula_Ano, mastricula_Semestre, matricula_CodAluno, matricula_CodCurso) VALUES (@ano, @semestre, @alunoMat, @codCurso)";
                cmd = new SqlCommand(query, con);

                string[] separator = { "." };
                string[] semestre = mat.matricula_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@alunoMat", mat.matricula_CodAluno);
                cmd.Parameters.AddWithValue("@codCurso", mat.matricula_CodCurso);
                cmd.ExecuteNonQuery();
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
                query = "UPDATE Matriculas SET matricula_Ano, = @ano, mastricula_Semestre = @semestre, matricula_CodAluno = @matAluno, matricula_CodCurso = @codCurso";
                cmd = new SqlCommand(query, con);

                string[] separator = { "." };
                string[] semestre = mat.matricula_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@alunoMat", mat.matricula_CodAluno);
                cmd.Parameters.AddWithValue("@codCurso", mat.matricula_CodCurso);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Matricula> Listar()
    }
}