--> Declaração do TYPO status_consulta
CREATE TYPE status_consulta AS ENUM ('Cancelado', 'Em andamento', 'Concluido', 'Agendado');

--> DECLARAÇÃO DA TABELA PACIENTE:
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(150) NOT NULL
);

--> DECLARAÇÃO DA TABELA DENTISTA:
CREATE TABLE dentista (
    id_dentista SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    cro VARCHAR(15) UNIQUE NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

--> DECLARAÇÃO DA TABELA PROCEDIMENTO:
CREATE TABLE procedimento (
    id_procedimento SERIAL PRIMARY KEY,
    nome_procedimento VARCHAR(150) NOT NULL,
    descricao TEXT,
    duracao TIME NOT NULL
);

--> DECLARAÇÃO DA TABELA HORARIO ATENDIMENTO:
CREATE TABLE horario_atendimento (
    id_horario_atendimento SERIAL PRIMARY KEY,
    horario_inicial TIME NOT NULL,
    horario_final TIME NOT NULL,
    
    --> Declaração das chaves estrangeiras
    id_dentista INTEGER REFERENCES dentista(id_dentista)
    -- NOT NULL ON DELETE SET NULL
    --> Vale apena um ON DELETE CASCADE ??
);

--> DECLARAÇÃO DA TABELA CONSULTA
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_horario TIMESTAMP NOT NULL,
    status status_consulta NOT NULL DEFAULT 'Agendado',
    --> PENSEI EM COMEÇAR COMO 'AGENDADO' AO INVEZ DE VAZIO

    --> Declaração das chaves estrangeiras
    id_paciente INTEGER REFERENCES paciente(id_paciente),
    -- NOT NULL ON DELETE SET NULL,

    id_dentista INTEGER REFERENCES dentista(id_dentista)
    -- NOT NULL ON DELETE SET NULL
);

---> DECLARAÇÃO DA TABELA LIGAÇÃO (M,M : Consulta <---> Procedimento)
CREATE TABLE proc_consult_conter (  
    id_consulta INTEGER REFERENCES consulta(id_consulta), --> Vale apena um ON DELETE CASCADE ??
    id_procedimento INTEGER REFERENCES procedimento(id_procedimento), --> Vale apena um ON DELETE RESTRIC ??

    --> Definindo a chave da tabela 
    PRIMARY KEY (id_consulta, id_procedimento)
);