--> Remove o horário do Dentista de id_dentista 3 que sejam acima ou igual a '13:00:00'
DELETE FROM horario_atendimento
WHERE id_dentista = 3
AND horario_final >= '13:00:00';

--> Remove um vinculo entre a consulta de id_consulta igual a 10 de id_procedimento igual a 8 na tabela proc_consult_conter
DELETE FROM proc_consult_conter 
WHERE id_consulta = 10 
and id_procedimento = 8;

--Remove da Tabela horario_atendimento aonde o horario inicial sejá igual a '08:00:00'.
DELETE FROM horario_atendimento
WHERE horario_inicial = '08:00:00'

/*Exemplo de exclusão que não funcionou devido a restrição da foreign key*/

--> Remove da Tabela Consulta onde status seja 'Agendado' e data_horario maior que '2024-05-15' não deleta por violar a restrição da foreign key.
-- delete from consulta 
-- where status = 'Agendado'
-- and data_horario :: date >= '2024-05-15'


/* Comando para verificar os DELETES */
-- select * from consulta where id_consulta  = 10
-- select * from horario_atendimento where horario_inicial < '09:00:00'
-- select * from proc_consult_conter order by id_consulta;