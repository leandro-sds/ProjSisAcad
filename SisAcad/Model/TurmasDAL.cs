﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class TurmasDAL {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SisAcadDB"].ConnectionString);
        private SqlCommand cmd;
        String query;

        public void Insert(Turmas turma) {
            try {
                con.Open();
                query = @"INSERT INTO Turmas (turma_Ano, turma_Semestre, turma_DiscCod, turma_Vagas, turma_IdProf, turma_CursoCod) 
                                        VALUES (@ano, @semestre, @codDisc, @vagas, @prof, @codCurso)";
                cmd = new SqlCommand(query, con);

                //Divide a string semestre em um vetor, contendo o ano e o semestre
                string[] separator = {"."};
                string[] semestre = turma.turma_Semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                cmd.Parameters.AddWithValue("@ano", semestre[0].ToString());
                cmd.Parameters.AddWithValue("@semestre", semestre[1].ToString());
                cmd.Parameters.AddWithValue("@codDisc", turma.turma_DiscCod);
                cmd.Parameters.AddWithValue("@vagas", turma.turma_Vagas);
                cmd.Parameters.AddWithValue("@prof", turma.turma_IdProf);
                cmd.Parameters.AddWithValue("@codCurso", turma.turma_CursoCod);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e) {
                throw new Exception("Erro. " + e.Message);
            }
            finally {
                con.Close();
            }
        }

        public List<Turmas> Listar() {
            try {
                con.Open();
                cmd = new SqlCommand(@"SELECT * FROM Turmas", con);
                SqlDataReader dr = cmd.ExecuteReader();
                List<Turmas> lista = new List<Turmas>();


                while (dr.Read()) {
                    Turmas turma = new Turmas();
                    turma.turma_Semestre = dr["turma_Semestre"].ToString();
                    turma.turma_Ano = dr["turma_Ano"].ToString();
                    turma.turma_CursoCod = Convert.ToInt32(dr["turma_CursoCod"].ToString());
                    turma.turma_DiscCod = Convert.ToInt32(dr["turma_DiscCod"].ToString());
                    turma.turma_IdProf = Convert.ToInt32(dr["turma_IdProf"].ToString());
                    turma.turma_Vagas = Convert.ToInt32(dr["turma_Vagas"].ToString());
                    lista.Add(turma);
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

        public List<Turmas> Listar(string semestre, int codCurso) {
            try {
                con.Open();
                query = @"SELECT * FROM Turmas WHERE 
                          (@ano IS NULL OR @ano = turma_Ano) AND
                          (@semestre IS NULL OR @semestre = turma_Semestre) AND
                          (@codCurso IS NULL OR @codCurso = turma_CursoCod)";
                cmd = new SqlCommand(query, con);

                if (string.IsNullOrEmpty(semestre)) {
                    cmd.Parameters.AddWithValue("@ano", DBNull.Value);
                    cmd.Parameters.AddWithValue("@semestre", DBNull.Value);
                } else {
                    string[] separator = { ".", "," };
                    string[] s = semestre.Split(separator, StringSplitOptions.RemoveEmptyEntries);

                    cmd.Parameters.AddWithValue("@ano", s[0].ToString());
                    cmd.Parameters.AddWithValue("@semestre", s[1].ToString());
                }

                if (codCurso == 0) {
                    cmd.Parameters.AddWithValue("@codCurso", DBNull.Value);
                } else {
                    cmd.Parameters.AddWithValue("@codCurso", codCurso);
                }

                SqlDataReader dr = cmd.ExecuteReader();
                List<Turmas> lista = new List<Turmas>();


                while (dr.Read()) {
                    Turmas turma = new Turmas();
                    turma.turma_Semestre = dr["turma_Ano"].ToString() + "." + dr["turma_Semestre"].ToString();
                    turma.turma_CursoCod = Convert.ToInt32(dr["turma_CursoCod"].ToString());
                    turma.turma_DiscCod = Convert.ToInt32(dr["turma_DiscCod"].ToString());
                    turma.turma_IdProf = Convert.ToInt32(dr["turma_IdProf"].ToString());
                    turma.turma_Vagas = Convert.ToInt32(dr["turma_Vagas"].ToString());
                    lista.Add(turma);
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