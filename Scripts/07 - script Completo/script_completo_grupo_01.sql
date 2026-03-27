/* ********************* SCRIPT CRIAÇÃO DB ********************* */

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
);

--> DECLARAÇÃO DA TABELA CONSULTA
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_horario TIMESTAMP NOT NULL,
    status status_consulta NOT NULL DEFAULT 'Agendado', --> PENSEI EM COMEÇAR COMO 'AGENDADO' AO INVEZ DE VAZIO

    --> Declaração das chaves estrangeiras
    id_paciente INTEGER REFERENCES paciente(id_paciente),
    id_dentista INTEGER REFERENCES dentista(id_dentista),
    id_procedimento INTEGER REFERENCES procedimento(id_procedimento)
);

---> DECLARAÇÃO DA TABELA LIGAÇÃO (M,M : Consulta <---> Procedimento)
CREATE TABLE proc_consult_conter (  
    id_consulta INTEGER REFERENCES consulta(id_consulta) ON DELETE RESTRICT,
    id_procedimento INTEGER REFERENCES procedimento(id_procedimento) ON DELETE RESTRICT,

    --> Definindo a chave da tabela 
    PRIMARY KEY (id_consulta, id_procedimento)
);

/* ********************* INSERÇÃO DE VALORES ********************* */
--> COMANDO DE INSERÇÃO NA TABELA PACIENTE:
INSERT INTO paciente
	(nome_completo, cpf, data_nascimento, telefone, email, endereco)
VALUES
	('Ana Maria Silva','12345678900','1993-05-20','11999887766','ana.silva@mail.com','Rua das Flores, 100'),
	('Marcos Paulo Lima','23456789011','1980-08-12','11988776655','marcos.lima@mail.com','Av. Brasil, 210'),
	('Pedro Almeida Oliveira','34567890122','1989-10-15','11977665544','pedro.almeida@mail.com','Rua Joana, 31'),
	('Paula Tejando Souza','45678901233','2001-09-07','11999886677','paula.souza@mail.com','Rua Curitiba, 44'),
	('Roberto Monteiro Dias','56789012344','1996-04-04','11999885522','roberto.dias@mail.com','Av. Paulista, 90'),
	('Luciana Gomes Torres', '67890123455','1987-09-21','11999884321','luciana.torres@mail.com','Rua Verde, 17'),
	('Camila Santoro Castro','78901234566','1995-12-23','11999881100','camila.castro@mail.com','Rua Bela, 75'),
	('Mateus Tamaki Ramos','89012345677','1973-11-19','11999880099','mateus.ramos@mail.com','Av. Central, 333'),
	('Bianca Prado Oliveiro','90123456788','1988-04-28','11998887766','bianca.prado@mail.com','Rua Prisma, 111'),
	('Sergio Nunes Albuquerque','01234567899','1999-07-22','11994442233','sergio.nunes@mail.com','Av. Santos, 2'),
	('Ana Silva Oliveira','12345678901', '1985-05-12', '11988887777', 'ana.silva@email.com','Rua das Flores, 123'),
	('Bruno Santos Ferreira','23456789012', '1990-11-23', '21977776666', 'bruno.santos@email.com','Av. Brasil, 456'),
	('Carla Souza Lima', '34567890123', '1978-02-15', '31966665555', 'carla.souza@email.com','Rua Bahia, 789'),
	('Diego Pereira Costa','45678901234', '1982-08-30', '41955554444', 'diego.costa@email.com','Rua Paraná, 101'),
	('Elena Martins Rocha','56789012345', '1995-04-10', '51944443333', 'elena.rocha@email.com','Av. Ipiranga, 202'),
	('Fabio Almeida Melo','67890123456', '1988-12-05', '61933332222', 'fabio.melo@email.com','Setor Comercial, 303'),
	('Giovanna Alves Dias','78901234567', '2000-01-20', '71922221111', 'gi.alves@email.com','Rua Salvador, 404'),
	('Henrique Gomes Luz','89012345678', '1975-06-18', '81911110000', 'henrique.luz@email.com','Rua Recife, 505'),
	('Isabela Castro Neves','90123456789', '1992-09-25', '85900009999', 'isabela.neves@email.com', 'Av. Santos Dumont, 606'),
	('João Vitor Borges', '01234567890', '1980-03-14', '92999998888', 'joao.vitor@email.com','Rua Amazonas, 707'),
	('Karen Mendes Silva','11234567891', '1987-07-07', '11987654321', 'karen.mendes@email.com', 'Rua Augusta, 808'),
	('Lucas Fernandes Araujo','22345678912', '1998-10-12', '21987654321', 'lucas.araujo@email.com','Rua Copacabana, 909'),
	('Mariana Cardoso', '33456789013', '1993-05-22', '31987654321', 'mari.cardoso@email.com', 'Rua Savassi, 1010'),
	('Nicolas Ribeiro', '44567890124', '1984-12-31', '41987654321', 'nicolas.r@email.com', 'Rua Curitiba, 1111'),
	('Olivia Duarte', '55678901235', '1970-01-01', '51987654321', 'olivia.duarte@email.com','Rua Porto, 1212'),
	('Pedro Henrique Lima','66789012346', '2002-04-15', '61987654321', 'pedro.lima@email.com','Asa Sul, 1313'),
	('Quintino Junior', '77890123457', '1965-08-20', '71987654321', 'quintino.jr@email.com','Barra, 1414'),
	('Renata Vasconcelos','88901234568', '1991-03-03', '81987654321', 'renata.v@email.com', 'Boa Viagem, 1515'),
	('Samuel Antunes', '99012345679', '1989-11-11', '85987654321', 'samuel.a@email.com', 'Meireles, 1616'),
	('Tatiana Moreira', '10123456780', '1996-06-25', '92987654321', 'tati.moreira@email.com', 'Centro, 1717'),
	('Ulysses Machado', '11223344556', '1972-09-14', '11912345678', 'ulysses@email.com','Vila Madalena, 1818'),
	('Vanessa Guimarães', '22334455667', '1983-02-28', '21912345678', 'vanessa.g@email.com','Niterói, 1919'),
	('Wagner Moura Silva','33445566778', '1979-07-19', '31912345678', 'wagner.moura@email.com', 'Contagem, 2020'),
	('Xavier Fontes', '44556677889', '1994-10-05', '41912345678', 'xavier@email.com', 'Londrina, 2121'),
	('Yara Barbosa', '55667788990', '1986-12-12', '51912345678', 'yara.barbosa@email.com', 'Canoas, 2222'),
	('Zeca Pagodinho Santos','66778899001', '1960-02-04', '61912345678', 'zeca.santos@email.com', 'Taguatinga, 2323'),
	('Alice Nogueira', '77889900112', '1997-08-08', '71912345678', 'alice.nog@email.com', 'Pelourinho, 2424'),
	('Bernardo Cavalcanti','88990011223', '1981-01-30', '81912345678', 'bernardo.c@email.com', 'Olinda, 2525'),
	('Cecília Meireles', '99001122334', '1999-05-05', '85912345678', 'cecilia.m@email.com','Aldeota, 2626'),
	('Davi Lucca Silva', '00112233445', '2010-10-10', '92912345678', 'davi.lucca@email.com', 'Adrianópolis, 2727');

--> COMANDO DE INSERÇÃO NA TABELA DENTISTA:
INSERT INTO dentista
	(nome_completo, cpf, cro, especialidade)
VALUES
	('Ricardo Alencar Souza','12345678901','SP-12345','Ortodontia'),
	('Mariana Dias Ferreira','23456789012','RJ-23456','Implantodontia'),
	('Carlos Alberto Menezes', '34567890123','MG-34567','Implantodontia'),
	('Beatriz Santos Oliveira','45678901234','PR-45678','Endodontia'),
	('Fernando Costa Silva', '56789012345','SC-56789','Periodontia'),
	('Juliana Lima Rocha','67890123456','RS-67890','Odontologia'),
	('Roberto Pires Gomes', '78901234567','BA-78901','Endodontia'),
	('Patrícia Mendes Vaz', '89012345678','ES-89012','Prótese Dentária'),
	('Gustavo Henrique Luz', '90123456789','GO-90123','Estomatologia'),
	('Helena Silveira Ramos','01234567890','DF-01234','Odontogeriatria'),
	('Ricardo Alencar Souza', '12345678901', 'SP-12345', 'Ortodontia'),
	('Mariana Dias Ferreira', '23456789012', 'RJ-23456', 'Implantodontia'),
	('Carlos Alberto Menezes', '34567890123', 'MG-34567','Implantodontia'),
	('Beatriz Santos Oliveira', '45678901234','PR-45678','Endodontia'),
	('Fernando Costa Silva', '56789012345', 'SC-56789','Periodontia'),
	('Juliana Lima Rocha', '67890123456', 'RS-67890','Odontologia'),
	('Roberto Pires Gomes','78901234567', 'BA-78901','Endodontia'),
	('Patrícia Mendes Vaz','89012345678', 'ES-89012','Prótese Dentária'),
	('Gustavo Henrique Luz', '90123456789', 'GO-90123','Estomatologia'),
	('Helena Silveira Ramos', '01234567890', 'DF-01234','Odontogeriatria'),
	('André Luiz Meireles','11234567800', 'CE-11223','Ortodontia'),
	('Sofia Braga Antunes','22345678911', 'PE-22334','Odontopediatria'),
	('Tiago Volpi Carvalho', '33456789022', 'AM-33445','Cirurgia Bucomaxilofacial'),
	('Larissa Manoela Cruz', '44567890133', 'PA-44556','Radiologia Odontológica'),
	('Marcelo Diniz Frota','55678901244', 'MT-55667','Disfunção Temporomandibular'),
	('Renata Fan Silveira','66789012355', 'MS-66778','Odontologia do Trabalho'),
	('Igor Cavalari Castro', '77890123466', 'RN-77889','Harmonização Orofacial'),
	('Vanessa Camargo Lima', '88901234577', 'PB-88990','Periodontia'),
	('Otávio Mesquita Neto', '99012345688', 'AL-99001','Prótese Dentária'),
	('Bárbara Evans Rosa','10123456799', 'SE-10102','Endodontia'),
	('Cauã Reymond Santos','12233445566', 'TO-12123','Implantodontia'),
	('Grazi Massafera Gil','23344556677', 'MA-23234','Odontopediatria'),
	('Felipe Titto Moraes','34455667788', 'PI-34345','Cirurgia Bucomaxilofacial'),
	('Paolla Oliveira Vaz','45566778899', 'RR-45456','Ortodontia'),
	('Lázaro Ramos Silva','56677889900', 'AP-56567','Estomatologia'),
	('Taís Araújo Rocha', '67788990011', 'AC-67678','Odontogeriatria'),
	('Rodrigo Lombardi Meira', '78899001122','RO-78789','Odontologia'),
	('Isis Valverde Lima','89900112233', 'ES-89890','Harmonização Orofacial'),
	('Bruno Gagliasso Pires', '90011223344', 'SP-90901','Implantodontia'),
	('Marina Ruy Barbosa','01122334455', 'RJ-01012','Radiologia Odontológica');



--> COMANDO DE INSERÇÃO NA PROCEDIMENTO:
INSERT INTO procedimento
	(nome_procedimento, descricao, duracao)
VALUES
('Profilaxia Simples', 'Remoção de placa bacteriana e polimento coronário.', '00:40:00'),
('Aplicação de Flúor', 'Aplicação de flúor tópico para remineralização do esmalte.','00:40:00'),
('Exame Clínico', 'Avaliação visual e tátil da cavidade bucal e tecidos moles.', '00:40:00'),
('Restauração de Resina', 'Reconstrução estética e funcional do dente 26 (Face O).','00:40:00'),
('Manutenção Ortodôntica', 'Troca de arcos e ativação do aparelho fixo superior.', '00:40:00'),
('Abertura Coronária', 'Acesso aos canais radiculares para tratamento endodôntico.','00:40:00'),
('Moldagem de Estudo', 'Obtenção de modelo em gesso para planejamento de prótese.','00:40:00'),
('Clareamento de Consultório','Aplicação de peróxido de hidrogênio a 35% com barreira gengival.','00:40:00'),
('Raspagem Subgengival', 'Remoção de cálculo dental em bolsas periodontais profundas.', '00:40:00'),
('Tomografia Computadorizada','Encaminhamento para exame de imagem 3D para implante.', '00:40:00'),
('Profilaxia Simples', 'Remoção de placa bacteriana e polimento coronário.', '00:40:00'),
('Aplicação de Flúor', 'Aplicação de flúor tópico para remineralização do esmalte.', '00:40:00'),
('Exame Clínico', 'Avaliação visual e tátil da cavidade bucal e tecidos moles.', '00:40:00'),
('Restauração de Resina', 'Reconstrução estética e funcional do dente 26 (Face O).', '00:40:00'),
('Manutenção Ortodôntica', 'Troca de arcos e ativação do aparelho fixo superior.', '00:40:00'),
('Abertura Coronária', 'Acesso aos canais radiculares para tratamento endodôntico.', '00:40:00'),
('Moldagem de Estudo', 'Obtenção de modelo em gesso para planejamento de prótese.', '00:40:00'),
('Clareamento de Consultório', 'Aplicação de peróxido de hidrogênio a 35% com barreira gengival.', '01:00:00'),
('Raspagem Subgengival', 'Remoção de cálculo dental em bolsas periodontais profundas.', '01:00:00'),
('Tomografia Computadorizada', 'Encaminhamento para exame de imagem 3D para implante.', '00:30:00'),
('Extração de Siso', 'Exodontia de terceiro molar incluso com osteotomia.', '01:30:00'),
('Instalação de Implante', 'Colocação de implante de titânio em região de dente ausente.', '01:30:00'),
('Endodontia (Canal)', 'Tratamento de canal em dente multirradicular.', '02:00:00'),
('Gengivoplastia', 'Cirurgia plástica periodontal para correção do sorriso gengival.', '01:00:00'),
('Colagem de Braquetes', 'Montagem de aparelho ortodôntico fixo completo.', '01:30:00'),
('Cimentação de Coroa', 'Fixação definitiva de coroa protética em cerâmica.', '00:45:00'),
('Pulpotomia', 'Remoção da polpa coronária em dente decíduo.', '00:40:00'),
('Facetas de Porcelana', 'Preparação e moldagem para facetas estéticas.', '02:30:00'),
('Urgência Odontológica', 'Atendimento para alívio de dor aguda ou abscesso.', '00:50:00'),
('Prótese Total', 'Ajuste e entrega de prótese total (dentadura).', '01:00:00'),
('Frenectomia Lingual', 'Remoção cirúrgica do freio lingual (língua presa).','00:45:00'),
('Capeamento Pulpar','Proteção do complexo dentino-pulpar com hidróxido de cálcio.','00:30:00'),
('Remoção de Tártaro','Raspagem supragengival com ultrassom e curetas.','00:50:00'),
('Biópsia de Tecido','Coleta de fragmento de lesão para exame anatomopatológico.','01:00:00'),
('Aparelho Removível','Ajuste de aparelho ortopédico funcional infantil.','00:30:00'),
('Clareamento Caseiro','Moldagem e entrega de moldeiras para uso noturno.','00:40:00'),
('Núcleo de Preenchimento','Reconstrução de dente tratado endodonticamente com pino.','01:00:00'),
('Odontopediatria','Condicionamento infantil e selante de fóssulas e fissuras.','00:50:00'),
('Cirurgia Pré-Protética','Regularização de rebordo alveolar para uso de prótese.','01:15:00'),
('Avaliação de DTM','Diagnóstico de disfunção da articulação temporomandibular.','01:00:00');
	


--> COMANDO DE INSERÇÃO NA TABELA HORARIO_ATENDIMENTO:
INSERT INTO horario_atendimento
	(horario_inicial, horario_final, id_dentista)
VALUES
('08:00:00','12:00:00', 1),
('13:30:00','17:30:00', 1),
('09:00:00','12:00:00', 2),
('08:00:00','13:00:00', 3),
('14:00:00','19:00:00', 4),
('07:30:00','11:30:00', 5),
('13:00:00','17:00:00', 6),
('13:00:00','18:00:00', 6),
('13:00:00','19:00:00', 6),
('08:00:00','12:00:00', 7),
('13:30:00','18:30:00', 2),
('10:00:00','16:00:00', 10),
('08:00:00','12:00:00',1),
('13:30:00','17:30:00',1),
('09:00:00','12:00:00',2),
('08:00:00','13:00:00',3),
('14:00:00','19:00:00',4),
('07:30:00','11:30:00',5),
('13:00:00','17:00:00',6),
('13:00:00','18:00:00',6),
('13:00:00','19:00:00',6),
('08:00:00','12:00:00',7),
('13:30:00','18:30:00',2),
('08:00:00','12:00:00',8),
('14:00:00','18:00:00',8),
('09:00:00','13:00:00',9),
('07:00:00','13:00:00',11),
('13:00:00','19:00:00',12),
('08:00:00','14:00:00',13),
('14:00:00','20:00:00',14),
('09:00:00','17:00:00',15),
('08:30:00','12:30:00',16),
('13:30:00','17:30:00',17),
('08:00:00','12:00:00',18),
('14:00:00','18:00:00',19),
('07:00:00','12:00:00',20),
('13:00:00','18:00:00',21),
('08:00:00','13:00:00',22),
('14:00:00','19:00:00',23),
('09:00:00','15:00:00',24),
('08:00:00','12:00:00',25);
	


--> COMANDO DE INSERÇÃO NA TABELA CONSULTA:
INSERT INTO consulta
	(data_horario, status, id_paciente, id_dentista)
VALUES
('2024-05-10 08:30:00', 'Concluido',1, 1),
('2024-05-10 10:00:00', 'Agendado',2, 7),
('2024-05-11 14:00:00', 'Agendado',3, 2),
('2024-05-12 09:15:00', 'Concluido',4, 1),
('2024-05-12 11:00:00', 'Em andamento', 5, 4),
('2024-05-13 15:30:00', 'Agendado',6, 8),
('2024-05-14 08:00:00', 'Cancelado',7, 5),
('2024-05-14 16:45:00', 'Concluido', 8, 6),
('2024-05-15 10:30:00', 'Em andamento', 9, 5),
('2024-05-15 14:00:00', 'Agendado', 10, 3),
('2024-05-16 09:00:00', 'Concluido', 11, 11),
('2024-05-16 11:30:00', 'Agendado', 12, 12),
('2024-05-17 08:00:00', 'Cancelado', 13, 13),
('2024-05-17 14:00:00', 'Concluido', 14, 14),
('2024-05-18 10:00:00', 'Agendado', 15, 15),
('2024-05-18 16:00:00', 'Em andamento', 16, 16),
('2024-05-19 09:30:00', 'Concluido', 17, 17),
('2024-05-19 13:00:00', 'Agendado', 18, 18),
('2024-05-20 08:30:00', 'Cancelado', 19, 19),
('2024-05-20 15:00:00', 'Concluido', 20, 20),
('2024-05-21 11:00:00', 'Agendado', 21, 21),
('2024-05-21 17:30:00', 'Em andamento', 22, 22),
('2024-05-22 09:00:00', 'Concluido', 23, 23),
('2024-05-22 14:00:00', 'Agendado', 24, 24),
('2024-05-23 10:30:00', 'Cancelado', 25, 25),
('2024-05-23 16:00:00', 'Concluido', 26, 26),
('2024-05-24 08:00:00', 'Agendado', 27, 27),
('2024-05-24 13:30:00', 'Em andamento', 28, 28),
('2024-05-25 10:00:00', 'Concluido', 29, 29),
('2024-05-25 15:00:00', 'Agendado', 30, 30);


--> COMANDO DE INSERÇÃO NA TABELA PROC_CONSULT_CONTER:
INSERT INTO proc_consult_conter
	(id_consulta, id_procedimento) 
VALUES 
(1, 1),(1, 2),(2, 3),(3, 1),(4, 4),
(5, 2),(5, 5),(6, 3),(7, 1),(8, 6),
(9, 7),(10, 8),(11, 9),(12, 10), (12, 1),
(13, 11), (14, 12), (15, 13), (16, 14), (17, 15),
(18, 16), (19, 17), (20, 18), (21, 19), (22, 20),
(23, 21), (24, 22), (25, 23), (25, 24), (26, 25),
(27, 26), (28, 27), (29, 28), (30, 29), (30, 30);

/* ********************* CRIAÇÃO DOS INDEXS ********************* */

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

/* ********************* ATUALIZAÇÃO DE DADOS ********************* */

--> Atualiza a consulta de 'id_consulta 5' para 'CONCLUIDO' na tabela consulta
UPDATE consulta
SET
  status = 'Concluido'
WHERE id_consulta = 5;

--> Atualiza o telefone do paciente de 'cpf  -> 56789012344' e 'endereço  -> Rua do Imperador, 100 - Centro, Petrópolis' 'telefone -> (24) 99999-8888' na tabela paciente
UPDATE paciente
SET
  telefone = '(24) 99999-8888',
  endereco = 'Rua do Imperador, 100 - Centro, Petrópolis'
WHERE cpf = '56789012344';

--> Atualiza a tabela consulta, somando 2h' ao horário marcado para todos os agendamentos do dentista com o id_dentista igual 2 que foram marcados no dia '2024-05-10'
UPDATE consulta
SET
  data_horario = data_horario + '02:00:00'  
WHERE id_dentista = 2
AND data_horario::DATE = '2024-05-11'
AND status = 'Agendado';


/* ********************* EXCLUSÃO DE REGISTROS ********************* */

--> Remove o horário final do dentista de id_dentista 3 que sejam acima ou igual a '18:00:00'
DELETE FROM horario_atendimento
WHERE id_dentista = 3
AND horario_final >= '18:00:00';

--> Remove um vinculo entre a consulta de id_consulta = 6 e id_procedimento = 2 na tabela proc_consult_conter
DELETE FROM proc_consult_conter
WHERE id_consulta = 6
AND id_procedimento = 2;

--> Remove da tabela consulta onde o status seja 'Cancelado' e data_horario maior que '2024-05-13 15:30:00'
DELETE FROM consulta
WHERE status = 'Cancelado'
AND data_horario > '2024-05-13 15:30:00';

/* ********************* CONSULTAS CONTEXTUALIZADAS ********************* */

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

-- --


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