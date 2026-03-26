/*
1ª - Quantidade de consultas por especialidade: selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

SELECT dent.especialidade, COUNT(con.id_consulta) AS total_de_consultas
FROM consulta con
JOIN dentista dent
  ON con.id_dentista = dent.id_dentista
GROUP BY dent.especialidade
ORDER BY total_consultas DESC;


/*
2ª - Quantidade de consultas realizadas por cada dentista: selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por cada um e exiba em ordem decrescente pela quantidade de consultas.
*/

SELECT dent.nome_completo AS Dentista, COUNT(con.id_consulta) AS total_de_consultas
FROM consulta con
RIGHT JOIN dentista dent
  ON con.id_dentista = dent.id_dentista
GROUP BY dent.nome_completo
ORDER BY total_consulta DESC;

/*
3º- Pacientes com maior número de consultas: liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente pelo número de consultas.
*/
/*
4º - View com lista de consultas ordenadas por data: crie uma VIEW que selecione os seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta, procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
*/
/*
5º - Média de consultas por dentista: calcule a média de consultas realizadas por dentista.
*/