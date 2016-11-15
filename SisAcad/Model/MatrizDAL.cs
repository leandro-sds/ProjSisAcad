using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class MatrizDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Matriz matriz) {
            using (SqlTransaction trans = new SqlTransaction()) {
                try {
                    query = "INSERT INTO Matrizes (matriz_CodCurso, matriz_CodDisc, matriz_Periodo) VALUES (@codCurso, @codDisc, @periodo)";
                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@codCurso", matriz.matriz_CodCurso);
                    cmd.Parameters.AddWithValue("@codDisc", matriz.matriz_CodDisc);
                    cmd.Parameters.AddWithValue("@periodo", matriz.matriz_Periodo);

                    trans.Commit();
                }
                catch (Exception e) {
                    trans.Rollback();
                    throw new Exception("erro" + e.Message);

                }
                finally {
                    con.Close();
                }
            }
        }
    }
}