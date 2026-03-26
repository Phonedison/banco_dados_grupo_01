--> COMANDO DE INSERÇÃO NA TABELA PACIENTE:
INSERT INTO paciente
	(nome_completo, cpf, data_nascimento, telefone, email, endereco)
VALUES
	('Ana Maria Silva',           '12345678900',     '1993-05-20',     '11999887766',     'ana.silva@mail.com',       'Rua das Flores, 100'),
	('Marcos Paulo Lima',         '23456789011',     '1980-08-12',     '11988776655',     'marcos.lima@mail.com',     'Av. Brasil, 210'),
	('Pedro Almeida Oliveira',    '34567890122',     '1989-10-15',     '11977665544',     'pedro.almeida@mail.com',   'Rua Joana, 31'),
	('Paula Tejando Souza',       '45678901233',     '2001-09-07',     '11999886677',     'paula.souza@mail.com',     'Rua Curitiba, 44'),
	('Roberto Monteiro Dias',     '56789012344',     '1996-04-04',     '11999885522',     'roberto.dias@mail.com',    'Av. Paulista, 90'),
	('Luciana Gomes Torres',      '67890123455',     '1987-09-21',     '11999884321',     'luciana.torres@mail.com',  'Rua Verde, 17'),
	('Camila Santoro Castro',     '78901234566',     '1995-12-23',     '11999881100',     'camila.castro@mail.com',   'Rua Bela, 75'),
	('Mateus Tamaki Ramos',       '89012345677',     '1973-11-19',     '11999880099',     'mateus.ramos@mail.com',    'Av. Central, 333'),
	('Bianca Prado Oliveiro',     '90123456788',     '1988-04-28',     '11998887766',     'bianca.prado@mail.com',    'Rua Prisma, 111'),
	('Sergio Nunes Albuquerque',  '01234567899',     '1999-07-22',     '11994442233',     'sergio.nunes@mail.com',    'Av. Santos, 2');

--> COMANDO DE INSERÇÃO NA TABELA DENTISTA:
INSERT INTO dentista
	(nome_completo, cpf, cro, especialidade)
VALUES
	('Ricardo Alencar Souza',      '12345678901',      'SP-12345',    'Ortodontia'),
	('Mariana Dias Ferreira',      '23456789012',      'RJ-23456',    'Implantodontia'),
	('Carlos Alberto Menezes',     '34567890123',      'MG-34567',    'Implantodontia'),
	('Beatriz Santos Oliveira',    '45678901234',      'PR-45678',    'Endodontia'),
	('Fernando Costa Silva',       '56789012345',      'SC-56789',    'Periodontia'),
	('Juliana Lima Rocha',         '67890123456',      'RS-67890',    'Odontologia'),
	('Roberto Pires Gomes',        '78901234567',      'BA-78901',    'Endodontia'),
	('Patrícia Mendes Vaz',        '89012345678',      'ES-89012',    'Prótese Dentária'),
	('Gustavo Henrique Luz',       '90123456789',      'GO-90123',    'Estomatologia'),
	('Helena Silveira Ramos',      '01234567890',      'DF-01234',    'Odontogeriatria');

--> COMANDO DE INSERÇÃO NA PROCEDIMENTO:
INSERT INTO procedimento
	(nome_procedimento, descricao, duracao)
VALUES
	('Profilaxia Simples',	        'Remoção de placa bacteriana e polimento coronário.',	               	'00:40:00'),
	('Aplicação de Flúor',	        'Aplicação de flúor tópico para remineralização do esmalte.',	       	'00:40:00'),
	('Exame Clínico',	            	'Avaliação visual e tátil da cavidade bucal e tecidos moles.',	   		'00:40:00'),
	('Restauração de Resina',	    	'Reconstrução estética e funcional do dente 26 (Face O).',	       		'00:40:00'),
	('Manutenção Ortodôntica',	    'Troca de arcos e ativação do aparelho fixo superior.',	          		'00:40:00'),
	('Abertura Coronária',	        'Acesso aos canais radiculares para tratamento endodôntico.',	       	'00:40:00'),
	('Moldagem de Estudo',	        'Obtenção de modelo em gesso para planejamento de prótese.',	       	'00:40:00'),
	('Clareamento de Consultório',	'Aplicação de peróxido de hidrogênio a 35% com barreira gengival.',  	'00:40:00'),
	('Raspagem Subgengival',	    	'Remoção de cálculo dental em bolsas periodontais profundas.',	    	'00:40:00'),
	('Tomografia Computadorizada',	'Encaminhamento para exame de imagem 3D para implante.'	,            	'00:40:00');

--> COMANDO DE INSERÇÃO NA TABELA HORARIO_ATENDIMENTO:
INSERT INTO horario_atendimento
	(horario_inicial, horario_final, id_dentista)
VALUES
	('08:00:00',    '12:00:00',    1),
	('13:30:00',    '17:30:00',    1),
	('09:00:00',    '12:00:00',    2),
	('08:00:00',    '13:00:00',    3),
	('14:00:00',    '19:00:00',    4),
	('07:30:00',    '11:30:00',    5),
	('13:00:00',    '17:00:00',    6),
	('08:00:00',    '18:00:00',    6),
	('13:00:00',    '19:00:00',    6),
	('08:00:00',    '12:00:00',    7),
	('13:30:00',    '18:30:00',    2),
	('10:00:00',    '16:00:00',    10);
	
--> COMANDO DE INSERÇÃO NA TABELA CONSULTA:
INSERT INTO consulta
	(data_horario, status, id_paciente, id_dentista)
VALUES
  ('2024-05-10 08:30:00',        'Concluido',        1,             1),
  ('2024-05-10 10:00:00',        'Agendado',         2,             7),
  ('2024-05-11 14:00:00',        'Concluido',        3,             2),
  ('2024-05-12 09:15:00',        'Concluido',        4,             1),
  ('2024-05-12 11:00:00',        'Em andamento',     5,             4),
  ('2024-05-13 15:30:00',        'Agendado',         6,             8),
  ('2024-05-14 08:00:00',        'Cancelado',        7,             5),
  ('2024-05-14 16:45:00',        'Concluido',        8,             6),
  ('2024-05-15 10:30:00',        'Em andamento',     9,             5),
  ('2024-05-15 14:00:00',        'Agendado',         10,            3);

--> COMANDO DE INSERÇÃO NA TABELA PROC_CONSULT_CONTER:
INSERT INTO proc_consult_conter
	(id_consulta, id_procedimento) 
VALUES 
	(1, 1), (1, 2), (2, 3), (3, 1),	(4, 4),
	(5, 2),	(5, 5),	(6, 3), (7, 1),	(8, 6);	