--> INDEX para consultar TABELA paciente:
CREATE INDEX consultar_nome_paciente ON paciente (nome_completo); --> por nome do paciente

--> INDEX para consultar TABELA consulta:
CREATE INDEX consultar_data_consulta ON consulta (data_horario); --> por data / horário
CREATE INDEX consultar_status ON consulta (status); --> por status

--> INDEX para consultar TABELA dentista:
CREATE INDEX consultar_dentista ON dentista (nome_completo); --> por nome do dentista
CREATE INDEX consultar_especialidade ON dentista (especialidade); --> por especialidade

--> INDEX para consultar TABELA procedimento:
CREATE INDEX consultar_procedimento ON procedimento (nome_procedimento); --> por procedimento