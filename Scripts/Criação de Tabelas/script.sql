/* Modelo_logico: */

--> CRIAÇÃO DA TABELA PACIENTE
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150),
    cpf VARCHAR(11),
    data_nascimento DATE,
    telefone VARCHAR(11),
    email VARCHAR(100),
    endereco VARCHAR(150),
    qtd_consultas INT
);

--> CRIAÇÃO DO TIPO STATUS_CONSULTA
CREATE TYPE status_consulta AS ENUM ('Cancelado', 'Em andamento', 'Concluido', 'Agendado');

--> CRIAÇÃO DA TABELA CONSULTA
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_horario DATE, --> TIMESTAMP
    descricao VARCHAR(150),
    prescricao VARCHAR(150),
    
    --> UTILIZANDO O TIPO
    status status_consulta,

    --> Declaração das chaves estrangeiras
    id_paciente INT REFERENCES paciente(id_paciente),
    id_dentista INT REFERENCES dentista (id_dentista),
    id_procedimento INT REFERENCES procedimento (id_procedimento)
);

--> CRIAÇÃO DA TABELA DENTISTA
CREATE TABLE dentista (
    id_dentista SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150),
    cpf VARCHAR(11),
    cro VARCHAR(10),
    especialidade VARCHAR(150)
);

--> CRIAÇÃO DA TABELA PROCEDIMENTO
CREATE TABLE procedimento (
    id_procedimento SERIAL PRIMARY KEY,
    nome_procedimento VARCHAR(150)
    descricao VARCHAR(300),
    duracao TIME,
);
--> CRIAÇÃO DA TABELA HORARIO ATENDIMENTO
CREATE TABLE horario_atendimento (
    id_horario_atendimento SERIAL PRIMARY KEY,
    horario_inical TIME,
    horiario_final TIME,

    --> Declaração das chaves estrangeiras
    id_dentista INT REFERENCES dentista(id_dentista),
);
