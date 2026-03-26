--> INDEX para consultar nome do paciente
CREATE INDEX consultar_paciente_nome ON paciente (nome_completo);
--> INDEX para consultar data da consulta
CREATE INDEX consultar_consulta_data ON consulta (data_horario);