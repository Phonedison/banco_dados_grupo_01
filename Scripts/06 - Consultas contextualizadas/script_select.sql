/*
1ª - Quantidade de consultas por especialidade:
Selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

  SELECT
    d.especialidade "Especialidade", --> Seleciona a coluna "Especialidade"
    COUNT (c.id_consulta) "Quant. Consultas" --> Conta o total de registros para cada "Especialidade"
    
  FROM consulta c

 
  INNER JOIN dentista d --> Relaciona as tabelas 'consultas' e 'dentista'
    ON c.id_dentista = d.id_dentista --> Garante apenas a pesquisa com os valores de id_dentista existentes em 'consulta' e 'dentista'

  GROUP BY d.especialidade --> Agrupo o resultados pelo nome da "Especialidade"
  ORDER BY "Quant. Consultas" DESC;  --> Ordena as linhas com base no maior para o menor valor de "Quant. Consulta"

/*
2ª - Quantidade de consultas realizadas por cada dentista:
Selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas
por cada um e exiba em ordem decrescente pela quantidade de consultas.
*/

  SELECT
    
    d.nome_completo "Dentista", --> Seleciona a coluna que contém o nome do "Dentista"
    COUNT(c.id_consulta) "Quant. Consultas" --> Conta o total de registros para cada "Dentista"

  FROM dentista d
  
  LEFT JOIN consulta c --> Relaciona as tabelas 'dentista' e 'consulta'
    ON c.id_dentista = d.id_dentista --> Garante apenas a pesquisa com os valores de id_dentista de 'dentista' presentes em 'consulta'
    
  GROUP BY d.nome_completo --> Agrupo o resultados pela entidade 'nome_completo'
  ORDER BY "Quant. Consultas" DESC; --> Ordena as linhas com base no maior para o menor valor de "Quant. Consultas"


/*
3º- Pacientes com maior número de consultas: 
Liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente
pelo número de consultas.
*/


  SELECT
   
    p.id_paciente, --> Seleciona a coluna "id_paciente"
    p.nome_completo "Nome Paciente", --> Seleciona a coluna "nome_completo"
    COUNT (c.status) "Quant. Consultas" --> Conta o total de registros para cada "tipo de status"

  FROM paciente p
 
  LEFT JOIN consulta c  --> Relaciona as tabelas 'paciente' e 'consulta'
    ON p.id_paciente = c.id_paciente --> Garante apenas a pesquisa com os valores de id_paciente de 'paciente' presentes em 'consulta'
  
  WHERE c.status <> 'Cancelado' --> Exigindo o retorno de todos o 'valores de status' da tabela 'consulta' que são diferentes de 'Cancelado'
  
  GROUP BY p.id_paciente, p.nome_completo --> Agrupando 'id_paciente' e 'nome_completo' da tabela 'paciente'
  ORDER BY "Quant. Consultas" DESC; --> Ordenando por 'id_paciente'

/*
4º - View com lista de consultas ordenadas por data:
Crie uma VIEW que selecione os seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta,
procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
*/

 
  CREATE VIEW vw_consultas AS  --> Cria a VIEW chamado vw_consultas
  
  SELECT
  
    c.id_consulta, --> Seleciona a coluna "id_consulta" da tabela consulta
    p.nome_completo "Paciente", --> Seleciona a coluna "nome_completo" da tabela consulta
    d.nome_completo "Dentista", --> Seleciona a coluna "nome_completo" da tabela dentista
    c.data_horario "Data/Horário", --> Seleciona a coluna "data_horario" da tabela consulta
    pr.nome_procedimento "Procedimento" --> Seleciona a coluna "procedimento" da tabela procedimento
    
  FROM consulta c --> Relaciona as tabelas 'consulta' com 'paciente'
  
  INNER JOIN paciente p --> Garante apenas a pesquisa com os valores de id_paciente de consulta existentes em 'paciente'
    ON p.id_paciente = c.id_paciente --> Relaciona as tabelas 'dentista' com 'consulta'
  
  INNER JOIN dentista d --> Garante apenas a pesquisa com os valores de id_dentista de consulta existentes em 'dentista'
    ON d.id_dentista = c.id_dentista --> Relaciona as tabelas 'consulta' com 'proc_consult_conter'
    
  INNER JOIN proc_consult_conter pro  --> Garante apenas a pesquisa com os valores de id_consula de consulta existentes em 'dentista'
    ON pro.id_consulta = c.id_consulta --> Relaciona as tabelas 'proc_consult_conter' com 'procedimento'  
 
  INNER JOIN procedimento pr --> Garante apenas a pesquisa com os valores de id_procedimento de proc_consult_conter existentes em 'procedimento'
    ON pr.id_procedimento = pro.id_procedimento --> Relaciona as tabelas 'proc_consult_conter' com 'procedimento'  
    
  GROUP BY --> Agrupo os atributos em valores unicos
    c.id_consulta,
    p.nome_completo,
    d.nome_completo,
    c.data_horario,
    pr.nome_procedimento

  ORDER BY c.data_horario DESC; --> Ordenando por data_horario por 'consulta'  

  SELECT * FROM vw_consultas; --> Utiliza a View 'vw_consultas' para visualizar os dados  

/*
5º - Média de consultas por dentista: 
Calcule a média de consultas realizadas por dentista.
*/

CREATE VIEW vw_porcentagem --> Criação da view vw_porcentagem para executar o código de forma simples e visualizar as informações

	AS (
		SELECT
     
			den.nome_completo AS "Dentista",  --> Seleciona a entidade 'nome_completo' da tabela 'dentista'
			COUNT(con.id_consulta) AS "QTD Realizada", --> Conta a quantidade de 'atendimento' realizado por 'dentista'
			SUM(COUNT(con.id_consulta)) OVER() AS "QTD ATENDIMENTO GERAL", --> Apresenta o 'valor total de atendimento de todos os dentistas'
      /*
      -> calculo de atendimento por cada por cada dentista : 'PERFORMACE ?'
        --> Multiplica por cem a contagem de linhas presentes na tabela consulta
        --> OVER (): força que a contagem das linhas seja realizado e junta a contagem sem desconciderar as linhas anteriores
        --> Divide a multiplicação pelo total geral de atendimento
        --> ROUND([valor]): arredonda o valor da divisão para até duas casas decimais
        --> CONCAT([valor],'%'): transforma o valor arredondado em um varchar / string com o simbolo % 
      */
			CONCAT(ROUND(COUNT(con.*) * 100.0 / SUM(COUNT(con.*)) OVER(), 2), ' %') AS "%"
		
		FROM 
		  dentista den
		
		LEFT JOIN consulta con --> Relaciona as tabelas 'consulta' com 'dentista'  
       --> Garante que a pesquisa dos valores de 'id_dentista' de 'dentista' existentes em 'consulta'
			ON den.id_dentista = con.id_dentista AND con.status = 'Concluido' --> Onde status de 'consulta' seja igual a "Concluido"(Realizado)
			
	
		GROUP BY 	-->	Agrupa os valores utilizando como base o atributo 'nome_completo' de dentista
		  den.nome_completo

	);


SELECT * FROM vw_porcentagem; --> visualiza a View

-- ---------------------------------------------------------------------------------------------------------- --


SELECT

  ROUND( AVG(qtd_consultas) , 2) AS media_de_consulta  --> Calcula a média da contagem e arredonda o valor para até 2 casas decimais do valor 'qtd_consultas'
FROM (

  SELECT
    COUNT(con.id_consulta) AS qtd_consultas --> Conta quantas consultas estão vinculadas a cada ID de dentista

    FROM dentista den
   
    LEFT JOIN consulta con --> Relaciona as tabelas 'consulta' com 'dentista'  
      ON den.id_dentista = con.id_dentista --> Garante que a pesquisa dos valores de 'id_dentista' de 'dentista' existentes em 'consulta'

	  WHERE con.status = 'Concluido'
    GROUP BY den.id_dentista -->	Agrupa os valores utilizando como base o atributo 'nome_completo' de dentista
);