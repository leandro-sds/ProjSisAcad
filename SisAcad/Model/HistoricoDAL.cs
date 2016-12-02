using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class HistoricoDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Historico hist) {
            try {
                con.Open();
                query = @"INSERT INTO Historicos (hist_Ano, hist_Semestre, hist_DiscCod, hist_MatAluno) 
                                        VALUES (@ano, @semestre, @discCod, @matAluno)";


                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ano", hist.hist_Ano);
                cmd.Parameters.AddWithValue("@semestre", hist.hist_Semestre);
                cmd.Parameters.AddWithValue("@discCod", hist.hist_DiscCod);
                cmd.Parameters.AddWithValue("@matAluno", hist.hist_MatAluno);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro hist. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void UpdateFaltas(int matAluno, int faltas) {
            try {
                con.Open();
                query = @"UPDATE Historicos SET hist_Faltas = @faltas WHERE hist_MatAluno = @mat";
                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@faltas", faltas);
                cmd.Parameters.AddWithValue("@mat", matAluno);

                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public void UpdateMedia(int media, int matAluno) {
            try {
                con.Open();
                query = @"UPDATE Historicos SET hist_Media = @media, hist_Situacao = @sit WHERE hist_MatAluno = @mat";
                cmd = new SqlCommand(query, con);

                string sit;
                if (media >= 6) {
                    sit = "AP";
                } else {
                    sit = "RP";
                }

                cmd.Parameters.AddWithValue("@media", media);
                cmd.Parameters.AddWithValue("@sit", sit);
                cmd.Parameters.AddWithValue("@mat", matAluno);

                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Historico> Listar(int matAluno) {
            try {
                con.Open();
                query = @"SELECT * FROM Historicos WHERE
                          (@mat IS NULL OR @mat = hist_MatAluno)";
                cmd = new SqlCommand(query, con);

                if (matAluno == 0) {
                    cmd.Parameters.AddWithValue("@mat", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@mat", matAluno);
                }
                SqlDataReader dr = cmd.ExecuteReader();
                List<Historico> lista = new List<Historico>();

                while (dr.Read()) {
                    Historico hist = new Historico();
                    hist.hist_Semestre = dr["hist_Ano"].ToString() + "." + dr["hist_Semestre"].ToString();
                    hist.hist_DiscCod = Convert.ToInt32(dr["hist_DiscCod"].ToString());
                    hist.hist_Faltas = Convert.ToInt32(dr["hist_Faltas"].ToString());
                    hist.hist_MatAluno = Convert.ToInt32(dr["hist_MatAluno"].ToString());
                    hist.hist_Media = Convert.ToInt32(dr["hist_Media"].ToString());
                    hist.hist_Situacao = dr["hist_Situacao"].ToString();
                    lista.Add(hist);
                }
                return lista;
            }
            catch (Exception e) {
                throw new Exception("erro. " + e.Message);
            }
            finally {

            }
        }
    }
}