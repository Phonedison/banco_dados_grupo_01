--> Remove o horário final do dentista de id_dentista 3 que sejam acima ou igual a '18:00:00'
DELETE FROM horario_atendimento
WHERE id_dentista = 1
AND horario_final >= '17:10:00';

--> Remove um vinculo entre a consulta de id_consulta = 6 e id_procedimento = 2 na tabela proc_consult_conter
DELETE FROM proc_consult_conter
WHERE id_consulta = 6
AND id_procedimento = 3;

SELECT * FROM proc_consult_conter ORDER BY id_consulta;

--> Remove da tabela consulta onde o status seja 'Cancelado' e data_horario maior que '2024-05-13 15:30:00'
DELETE FROM consulta
WHERE status = 'Cancelado'
AND data_horario > '2024-05-13 15:30:00';