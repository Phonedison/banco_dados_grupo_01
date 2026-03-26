UPDATE consulta SET status = 'Concluido' WHERE id_consulta = 5;

UPDATE paciente SET telefone = '(24) 99999-8888', endereco = 'Rua do Imperador, 100 - Centro, Petrópolis' WHERE cpf = '56789012344';

UPDATE consulta 
SET data_horario = data_horario + INTERVAL '2 hours'
WHERE id_dentista = 2 
  AND data_horario::DATE = '2026-03-26' 
  AND status = 'Agendado';