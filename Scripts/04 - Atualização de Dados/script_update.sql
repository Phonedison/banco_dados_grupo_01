
--> Atualiza a consulta de 'id_consulta 5' para 'CONCLUIDO' na tabela consulta
UPDATE consulta
SET
  status = 'Concluido'
WHERE id_consulta = 5;

--> Atualiza o telefone do paciente de 'cpf -> 56789012344' e 'endereço -> Rua do Imperador, 100 - Centro, Petrópolis' 'telefone -> (24) 99999-8888' na tabela paciente
UPDATE paciente
SET
  telefone = '(24) 99999-8888',
  endereco = 'Rua do Imperador, 100 - Centro, Petrópolis'
WHERE cpf = '56789012344';

--> Atualiza a tabela consulta, somando 2h' ao horário marcado para todos os agendamentos do dentista com o id_dentista igual 2 que foram marcados no dia '2024-05-11'
UPDATE consulta
SET
  data_horario = data_horario + '02:00:00'  
WHERE id_dentista = 2
AND data_horario::DATE = '2024-05-11'
AND status = 'Agendado';