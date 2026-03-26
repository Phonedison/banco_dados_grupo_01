/*
1ª - Quantidade de consultas por especialidade: selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

SELECT dent.especialidade, COUNT(con.id_consulta) AS total_de_consultas
FROM consulta con
JOIN dentista dent
  ON con.id_dentista = dent.id_dentista
GROUP BY dent.especialidade
ORDER BY total_consultas DESC;

