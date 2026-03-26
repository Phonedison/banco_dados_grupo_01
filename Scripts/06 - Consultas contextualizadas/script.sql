/*
1ª - Quantidade de consultas por especialidade: selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

SELECT
  dent.especialidade,
  COUNT(con.id_consulta) AS total_de_consultas

FROM consulta con

JOIN dentista dent
  ON con.id_dentista = dent.id_dentista

GROUP BY dent.especialidade
ORDER BY total_consultas DESC;


/*
2ª - Quantidade de consultas realizadas por cada dentista: selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por cada um e exiba em ordem decrescente pela quantidade de consultas.
*/

SELECT
  dent.nome_completo AS Dentista,
  COUNT(con.id_consulta) AS total_de_consultas

FROM consulta con

RIGHT JOIN dentista dent
  ON con.id_dentista = dent.id_dentista

GROUP BY dent.nome_completo
ORDER BY total_consulta DESC;

/*
3º- Pacientes com maior número de consultas: liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente pelo número de consultas.
*/

SELECT
  pac.nome_completo AS Pacientes,
  COUNT(con.id_consulta) AS total_de_consultas
FROM consulta con

RIGHT JOIN paciente pac
  ON con.id_paciente = pac.id_paciente

GROUP BY pac.nome_completo
ORDER BY total_consulta DESC;

/*
4º - View com lista de consultas ordenadas por data: crie uma VIEW que selecione os seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta, procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
*/

    CREATE VIEW lista_de_consultas AS (
      (
        SELECT
          con.id_consulta AS "ID CONSULTA",
          pac.nome_paciente AS "PACIENTE",
          den.nome_dentista AS "DENTISTA",
          con.data_horario AS "DATA DA CONSULTA",
          pro.nome_procedimento AS "PROCEDIMENTO"

        FROM consulta con

        LEFT JOIN paciente pac
          ON con.id_paciente = pac.id_paciente

        LEFT JOIN dentista den
          ON con.id_dentista = den.id_dentista
          
        LEFT JOIN procedimento pro
          ON con.id_procedimento = pro.id_procedimento

        GROUP BY id_consulta
        ORDER BY data_horario DESC
      )
    );

/*
5º - Média de consultas por dentista: calcule a média de consultas realizadas por dentista.
*/

SELECT
  den.nome_completo AS "DENTISTA",
  COUNT(con.id_consulta) AS "TOTAL CONSULTA",
  ( SELECT COUNT(id_consulta) FROM consulta ) AS total_geral,
  COUNT(con.id_consulta) * 1.0 / (SELECT COUNT(id_consulta) FROM consulta) AS media_participacao
FROM 
  dentista den
LEFT JOIN consulta con
  ON den.id_dentista = con.id_dentista
GROUP BY 
  den.nome_completo;