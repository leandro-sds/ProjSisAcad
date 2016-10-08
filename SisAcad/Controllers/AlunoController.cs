﻿using SisAcad.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SisAcad.Controllers
{
    [DataObject(true)]
    public class AlunoController : ApiController {
        AlunoDAL alunoDAL = new AlunoDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Aluno objAluno) {

            alunoDAL.Insert(objAluno);
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Aluno objAluno) {

            alunoDAL.Update(objAluno);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Aluno> Listar(int mat, String nome, int codCurso) {
            return alunoDAL.Listar(mat, nome, codCurso);
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Aluno objAluno) {
            alunoDAL.Delete(objAluno);
        }
    }
}