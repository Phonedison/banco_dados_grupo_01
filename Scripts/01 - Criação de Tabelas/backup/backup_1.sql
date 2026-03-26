


/* Modelo_logico: */

--> CRIAÇÃO DA TABELA PACIENTE
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(11),
    email VARCHAR(100),
    endereco VARCHAR(150) NOT NULL
);

--> CRIAÇÃO DO TIPO STATUS_CONSULTA
CREATE TYPE status_consulta AS ENUM ('Cancelado', 'Em andamento', 'Concluido', 'Agendado');

--> CRIAÇÃO DA TABELA CONSULTA
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_horario TIMESTAMP NOT NULL --> TIMESTAMP
    
    --> UTILIZANDO O TIPO
    status status_consulta NOT NULL,

    --> Declaração das chaves estrangeiras
    id_paciente INT REFERENCES paciente(id_paciente) NOT NULL,
    id_dentista INT REFERENCES dentista (id_dentista) NOT NULL,
    id_procedimento INT REFERENCES procedimento (id_procedimento) NOT NULL
);

--> CRIAÇÃO DA TABELA DENTISTA
CREATE TABLE dentista (
    id_dentista SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    cro VARCHAR(10) NOT NULL,
    especialidade VARCHAR(150) NOT NULL
);

--> CRIAÇÃO DA TABELA PROCEDIMENTO
CREATE TABLE procedimento (
    id_procedimento SERIAL PRIMARY KEY,
    nome_procedimento VARCHAR(150) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    duracao TIME NOT NULL
);
CREATE TABLE 

--> CRIAÇÃO DA TABELA HORARIO ATENDIMENTO
CREATE TABLE horario_atendimento (
    id_horario_atendimento SERIAL PRIMARY KEY,
    horario_inicial TIME NOT NULL,
    horiario_final TIME NOT NULL,

    --> Declaração das chaves estrangeiras
    id_dentista INT REFERENCES dentista(id_dentista)
);
