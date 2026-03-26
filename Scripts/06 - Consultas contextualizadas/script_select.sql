/*
1ª - Quantidade de consultas por especialidade: selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

  SELECT
    d.especialidade "Especialidade", 
    COUNT (c.id_consulta) "Quant. Consultas" 
    
  FROM consulta c

  INNER JOIN dentista d
    ON c.id_dentista = d.id_dentista

  GROUP BY d.especialidade
  ORDER BY "Quant. Consultas" DESC;



/*
2ª - Quantidade de consultas realizadas por cada dentista: selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por cada um e exiba em ordem decrescente pela quantidade de consultas.
*/

  SELECT
    d.nome_completo "Dentista", 
    COUNT(c.id_consulta) "Quant. Consultas"

  FROM dentista d

  LEFT JOIN consulta c
    ON c.id_dentista = d.id_dentista

  GROUP BY d.nome_completo
  ORDER BY "Quant. Consultas" DESC;


/*
3º- Pacientes com maior número de consultas: liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente pelo número de consultas.
*/


  SELECT
    p.id_paciente,
    p.nome_completo "Nome Paciente",
    COUNT (c.status) "Quant. Consultas"

  FROM paciente p

  LEFT JOIN consulta c
    ON p.id_paciente = c.id_paciente

  WHERE c.status <> 'Cancelado'

  GROUP BY p.id_paciente, p.nome_completo
  ORDER BY id_paciente DESC;

/*
4º - View com lista de consultas ordenadas por data: crie uma VIEW que selecione os seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta, procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
*/

  CREATE VIEW vw_consultas AS

  SELECT
    c.id_consulta,
    p.nome_completo "Paciente",
    d.nome_completo "Dentista",
    c.data_horario "Data/Horário",
    pr.nome_procedimento "Procedimento"
    
  FROM consulta c

  INNER JOIN paciente p 
    ON p.id_paciente = c.id_paciente
    
  INNER JOIN dentista d 
    ON d.id_dentista = c.id_dentista
    
  INNER JOIN proc_consult_conter proc 
    ON proc.id_consulta = c.id_consulta

  INNER JOIN procedimento pr
    ON pr.id_procedimento = proc.id_procedimento
    
  GROUP BY
    c.id_consulta,
    p.nome_completo,
    d.nome_completo,
    c.data_horario,
    pr.nome_procedimento
    
  ORDER BY c.data_horario DESC;

  select * from vw_consultas;

/*
5º - Média de consultas por dentista: calcule a média de consultas realizadas por dentista.
*/

CREATE VIEW vw_porcentagem
	AS (
		SELECT
			den.nome_completo AS "Dentista",
			COUNT(con.id_consulta) AS "QTD Realizada",
			SUM(COUNT(con.id_consulta))
			OVER() AS "QTD ATENDIMENTO GERAL",
			CONCAT(ROUND(COUNT(con.*) * 100.0 / SUM(COUNT(con.*)) OVER(), 2), ' %') AS "%"
		
		FROM 
		  dentista den
		
		LEFT JOIN consulta con
			ON den.id_dentista = con.id_dentista
			AND con.status = 'Concluido'
			
		GROUP BY 
		  den.nome_completo
	);

SELECT * FROM vw_porcentagem;