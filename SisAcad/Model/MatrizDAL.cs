﻿using System;
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
            con.Open();
            using (SqlTransaction trans = con.BeginTransaction()) {
                try {
                    
                    //con.Open();
                    query = "INSERT INTO Matrizes (matriz_CodCurso, matriz_CodDisc, matriz_Periodo) VALUES (@codCurso, @codDisc, @periodo)";
                    cmd = new SqlCommand(query, con);
                    

                    cmd.Parameters.AddWithValue("@codCurso", matriz.matriz_CodCurso);
                    cmd.Parameters.AddWithValue("@periodo", matriz.matriz_Periodo);
                    cmd.Parameters.AddWithValue("@codDisc", matriz.matriz_CodDisc);
                    cmd.Transaction = trans;
                    cmd.ExecuteNonQuery();
                    

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

        public List<Matriz> GetMatriz(int codCurso) {
            try {
                con.Open();
                cmd = new SqlCommand(@"SELECT * FROM Matrizes WHERE matriz_CodCurso = @codCurso", con);
                cmd.Parameters.AddWithValue("@codCurso", codCurso);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Matriz> lista = new List<Matriz>();
                

                while (dr.Read()) {
                    Matriz matriz = new Matriz();
                    matriz.matriz_CodCurso = Convert.ToInt32(dr["matriz_CodCurso"].ToString());
                    matriz.matriz_CodDisc = Convert.ToInt32(dr["matriz_CodDisc"].ToString());
                    matriz.matriz_Periodo = Convert.ToInt32(dr["matriz_Periodo"].ToString());
                    lista.Add(matriz);
                }
                return lista;
                    
            }
            catch (Exception e) {
                throw new Exception("erro." + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Matriz> Listar(int periodo) {
            try {
                con.Open();
                query = @"SELECT * FROM Matrizes WHERE (@periodo IS NULL OR @periodo = matriz_Periodo)";
                cmd = new SqlCommand(query, con);

                /*if (curso == 0) {
                    cmd.Parameters.AddWithValue("@codCurso", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@codCurso", curso);
                }*/

                if (periodo == 0) {
                    cmd.Parameters.AddWithValue("@periodo", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@periodo", periodo);
                }

                /*if (disc == 0) {
                    cmd.Parameters.AddWithValue("@codDisc", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@codDisc", disc);
                }*/
                
                SqlDataReader dr = cmd.ExecuteReader();
                List<Matriz> lista = new List<Matriz>();


                while (dr.Read()) {
                    Matriz matriz = new Matriz();
                    matriz.matriz_CodCurso = Convert.ToInt32(dr["matriz_CodCurso"].ToString());
                    matriz.matriz_CodDisc = Convert.ToInt32(dr["matriz_CodDisc"].ToString());
                    matriz.matriz_Periodo = Convert.ToInt32(dr["matriz_Periodo"].ToString());
                    lista.Add(matriz);
                }
                return lista;
            }
            catch (Exception e) {
                throw new Exception("erro " + e.Message);
            }
            finally {

            }
        }
    }
}