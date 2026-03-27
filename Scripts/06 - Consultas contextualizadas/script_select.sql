/*
1ª - Quantidade de consultas por especialidade:
Selecione todas as especialidades dos dentistas e faça um COUNT para contar o número total de consultas realizadas por cada especialidade.
*/

  SELECT
    --> Seleciona a coluna "Especialidade"
    d.especialidade "Especialidade",
    --> Conta o total de registros para cada "Especialidade"
    COUNT (c.id_consulta) "Quant. Consultas"
    
  FROM consulta c

  --> Relaciona as tabelas 'consultas' e 'dentista'
  INNER JOIN dentista d
    --> Garante apenas a pesquisa com os valores de id_dentista existentes em 'consulta' e 'dentista'
    ON c.id_dentista = d.id_dentista

  --> Agrupo o resultados pelo nome da "Especialidade"
  GROUP BY d.especialidade
  --> Ordena as linhas com base no maior para o menor valor de "Quant. Consulta"
  ORDER BY "Quant. Consultas" DESC;

/*
2ª - Quantidade de consultas realizadas por cada dentista:
Selecione o nome de todos os dentistas e faça um COUNT para contar a quantidade de consultas realizadas
por cada um e exiba em ordem decrescente pela quantidade de consultas.
*/

  SELECT
    --> Seleciona a coluna que contém o nome do "Dentista"
    d.nome_completo "Dentista", 
    --> Conta o total de registros para cada "Dentista"
    COUNT(c.id_consulta) "Quant. Consultas"

  FROM dentista d
  --> Relaciona as tabelas 'dentista' e 'consulta'
  LEFT JOIN consulta c
   --> Garante apenas a pesquisa com os valores de id_dentista de 'dentista' presentes em 'consulta'
    ON c.id_dentista = d.id_dentista
    
  --> Agrupo o resultados pela entidade 'nome_completo'
  GROUP BY d.nome_completo
  --> Ordena as linhas com base no maior para o menor valor de "Quant. Consultas"
  ORDER BY "Quant. Consultas" DESC;


/*
3º- Pacientes com maior número de consultas: 
Liste os pacientes e a quantidade de consultas que cada um realizou, ordenando em ordem decrescente
pelo número de consultas.
*/


  SELECT
    --> Seleciona a coluna "id_paciente"
    p.id_paciente,
    --> Seleciona a coluna "nome_completo"
    p.nome_completo "Nome Paciente",
    --> Conta o total de registros para cada "tipo de status"
    COUNT (c.status) "Quant. Consultas"

  FROM paciente p
  --> Relaciona as tabelas 'paciente' e 'consulta'
  LEFT JOIN consulta c
   --> Garante apenas a pesquisa com os valores de id_paciente de 'paciente' presentes em 'consulta'
    ON p.id_paciente = c.id_paciente
  --> Exigindo o retorno de todos o 'valores de status' da tabela 'consulta' que são diferentes de 'Cancelado'
  WHERE c.status <> 'Cancelado'
  --> Agrupando 'id_paciente' e 'nome_completo' da tabela 'paciente'
  GROUP BY p.id_paciente, p.nome_completo
  --> Ordenando por 'id_paciente'
  ORDER BY "Quant. Consultas" DESC;

/*
4º - View com lista de consultas ordenadas por data:
Crie uma VIEW que selecione os seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta,
procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
*/

  --> Cria a VIEW chamado vw_consultas
  CREATE VIEW vw_consultas AS
  
  SELECT
  --> Seleciona a coluna "id_consulta" da tabela consulta
    c.id_consulta,
    --> Seleciona a coluna "nome_completo" da tabela consulta
    p.nome_completo "Paciente",
    --> Seleciona a coluna "nome_completo" da tabela dentista
    d.nome_completo "Dentista",
    --> Seleciona a coluna "data_horario" da tabela consulta
    c.data_horario "Data/Horário",
    --> Seleciona a coluna "procedimento" da tabela procedimento
    pr.nome_procedimento "Procedimento"
    
  FROM consulta c
  --> Relaciona as tabelas 'consulta' com 'paciente'
  INNER JOIN paciente p 
    --> Garante apenas a pesquisa com os valores de id_paciente de consulta existentes em 'paciente'
    ON p.id_paciente = c.id_paciente  
  --> Relaciona as tabelas 'dentista' com 'consulta'
  INNER JOIN dentista d 
     --> Garante apenas a pesquisa com os valores de id_dentista de consulta existentes em 'dentista'
    ON d.id_dentista = c.id_dentista
  --> Relaciona as tabelas 'consulta' com 'proc_consult_conter'  
  INNER JOIN proc_consult_conter pro 
    --> Garante apenas a pesquisa com os valores de id_consula de consulta existentes em 'dentista'
    ON pro.id_consulta = c.id_consulta
  --> Relaciona as tabelas 'proc_consult_conter' com 'procedimento'  
  INNER JOIN procedimento pr
  --> Garante apenas a pesquisa com os valores de id_procedimento de proc_consult_conter existentes em 'procedimento'
    ON pr.id_procedimento = pro.id_procedimento
    
  --> Agrupo os atributos
  GROUP BY
    c.id_consulta,
    p.nome_completo,
    d.nome_completo,
    c.data_horario,
    pr.nome_procedimento

  --> Ordenando por data_horario por 'consulta'  
  ORDER BY c.data_horario DESC;

  --> Utiliza a View 'vw_consultas' para visualizar os dados  
  SELECT * FROM vw_consultas;

/*
5º - Média de consultas por dentista: 
Calcule a média de consultas realizadas por dentista.
*/

--> Criação da view vw_porcentagem
CREATE VIEW vw_porcentagem
  --> que contém os valores de atendimento de cada dentista / valor total de atendimento / porcentagem 
	AS (
    
		SELECT
      --> Seleciona a entidade 'nome_completo' da tabela 'dentista'
			den.nome_completo AS "Dentista",

      --> Conta a quantidade de 'atendimento' realizado por 'dentista'
			COUNT(con.id_consulta) AS "QTD Realizada",

      --> Apresenta o 'valor total de atendimento de todos os dentistas'
			SUM(COUNT(con.id_consulta)) OVER() AS "QTD ATENDIMENTO GERAL",
      /*
      -> Calculo de Performace:
        --> Multiplica por cem a contagem de linhas presentes na tabela consulta
        --> Divide a multiplicação pelo total geral de atendimento
        --> ROUND([valor]): arredonda o valor da divisão para até duas casas decimais
        --> CONCAT([valor],'%'): transforma o valor arredondado em uma string com o simbolo % 
      */
			CONCAT(ROUND(COUNT(con.*) * 100.0 / SUM(COUNT(con.*)) OVER(), 2), ' %') AS "%"
		
		FROM 
		  dentista den
		
    --> Relaciona as tabelas 'consulta' com 'dentista'  
		LEFT JOIN consulta con
       --> Garante que a pesquisa dos valores de 'id_dentista' de 'dentista' existentes em 'consulta'
			ON den.id_dentista = con.id_dentista AND con.status = 'Concluido' --> Onde status de 'consulta' seja igual a "Concluido"(Realizado)
			
		-->	Agrupa os valores utilizando como base o atributo 'nome_completo' de dentista
		GROUP BY 
		  den.nome_completo

	);

--> visualiza a View
SELECT * FROM vw_porcentagem;

-- ---------------------------------------------------------------------------------------------------------- --


SELECT
 --> Calcula a média da contagem e arredonda o valor para até 2 casas decimais do valor 'qtd_consultas'
  ROUND( AVG(qtd_consultas) , 2) AS media_de_consulta
FROM (

  SELECT
    --> Conta quantas consultas estão vinculadas a cada ID de dentista
    COUNT(con.id_consulta) AS qtd_consultas

    FROM dentista den

    --> Relaciona as tabelas 'consulta' com 'dentista'  
    LEFT JOIN consulta con
      --> Garante que a pesquisa dos valores de 'id_dentista' de 'dentista' existentes em 'consulta'
      ON den.id_dentista = con.id_dentista

	  -->	Agrupa os valores utilizando como base o atributo 'nome_completo' de dentista
    GROUP BY den.id_dentista
);