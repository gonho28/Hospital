CREATE TABLE Ambulatórios(
nroa int primary key,
andar int,
capacidade char(7)
);

CREATE TABLE Médicos(
codm int primary key,
CPF numeric(11),
Nome varchar(50),
idade int,
cidade varchar(50),
especialidade varchar(50),
nroa int, 
foreign key(nroa) references Ambulatórios(nroa)
);

CREATE TABLE Pacientes(
codp int primary key,
CPF numeric(11),
Nome varchar(50),
idade int,
cidade varchar(50),
doença varchar(50)
);

CREATE TABLE Consultas(
codm int,
codp int,
Data date not null,
Hora time not null,
primary key(codm, codp),
foreign key(codm) references Médicos(codm),
foreign key (codp) references Pacientes(codp)
);

INSERT INTO Ambulatórios 
values(1, 3, 8),
(2, 7, 8),
(10, 2, 5),
(8, 1, 9),
(3, 4, 6),
(9, 3, 4),
(6, 5, 2),
(7, 6, 3);

INSERT INTO Médicos
VALUES
(0001, 14889221132, 'Gabriel Freire de Lima', 56, 'Cuitegi', 'Oncologista', 7),
(0002, 14299394593, 'Kamyla Felix da Silva', 43, 'Araçagi', 'Odontologista', 2),
(0003, 11183402945, 'José de Sousa Barros', 45, 'Chicago', 'Infectologista', 10),
(0004, 99284738323, 'Daniel da Silva Goncalves', 77, 'Guarabira', 'Infectologista', 9),
(0005, 28393925134, 'Pedro Gabriel Ernesto da Silva', 93, 'Cracóvia', 'Neurologista', 6),
(0006, 82391122392, 'Jordan Terrell Carter', 29, 'Atlanta', 'Dermatologista', 8),
(0007, 82363429582, 'Mauro Davi dos Santos Nepomuceno', 25, 'Rio de Janeiro', 'Infectologista', 1),
(0008, 83824581309, 'Kanye Omari West', 48, 'Atlanta', 'Infectologista', 3);

INSERT INTO Pacientes
values(0011, 12093583232, 'Iago Saraiva Meireles Avelino Estevão', 17, 'Guarabira', 'Câncer de Pulmão'),
(0022, 18389284324, 'Maria Isabelly Dias da Silva', 18, 'Pirpirituba', 'Cárie'),
(0033, 13784385426, 'John Paul Albuquerque Caldas', 47, 'Mari', 'Botulismo'),
(0044, 17399325102, 'José Rodrigues de Paiva Neto', 19, 'Guarabira', 'Aids'),
(0055, 18392494043, 'Hálisson Barreto Vieira', 30, 'Nova Iorque', 'Alzheimer'),
(0066, 19302983201, 'Antônio Gabriel Cirilo dos Santos', 17, 'Washington D.C.', 'Vitiligo'),
(0077, 21392834933, 'Sir Bobson der Goodson Donald XII', 230, 'Versalhes', 'Peste Bubônica'),
(0088, 73833202003, 'Isadora Benício Teles da Silva', 18, 'João Pessoa', 'Ebola');

INSERT INTO Consultas
VALUES
(0001, 0011, '2024-05-10','09:06:14'),
(0002, 0022, '2023-07-15','08:07:39'),
(0003, 0033, '2020-03-12','08:46:00'),
(0004, 0044, '2024-06-20','14:03:55'),
(0005, 0055, '2021-11-09','19:00:00'),
(0006, 0066, '2023-04-18','02:09:18'),
(0007, 0077, '2020-10-30','03:00:00'),
(0008, 0088, '2024-02-22','09:07:00');

 CREATE VIEW HORA_MÉDICO as 
 select m.nome as "Nome do Médico", p.nome as "Nome do Paciente", c.hora 
 from Consultas c
 join Médicos m on m.codm = c.codm
 join Pacientes p on p.codp = c.codp;
 
 CREATE VIEW MEDICO_INFO as 
 select c.hora, a.nroa, m.nome
 from Consultas c 
 join Médicos m on m.codm = c.codm
 join Ambulatórios a on a.nroa = m.nroa;
 
 CREATE VIEW MÉDICOS_NOME as
 select m.nome, c.data, c.hora
 from Consultas c 
 right join Médicos m on m.codm = c.codm;
 
 CREATE VIEW PACIENTES_INFO as
 select p.idade, p.doença, m.nome, a.nroa
 from Consultas c 
 join Pacientes p on p.codp = c.codp
 join Médicos m on m.codm = c.codm
 join Ambulatórios a on a.nroa = m.nroa;
