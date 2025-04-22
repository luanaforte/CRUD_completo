-- Criar banco de dados
CREATE DATABASE clinica;

-- usar banco de dados
USE clinica;

-- criando tabela
CREATE TABLE medico 
(
	id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome_medico VARCHAR(100),
    crm INT,
    telefone NUMERIC(11),
    email VARCHAR(50)
);

CREATE TABLE paciente
(
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome_paciente VARCHAR(100),
    cpf NUMERIC(11),
    telefone NUMERIC(11),
    email VARCHAR(50)
);

CREATE TABLE consulta
(
	id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE,
    fk_medico INT,
    fk_paciente INT,
    
    FOREIGN KEY(fk_medico) REFERENCES medico (id_medico),
    FOREIGN KEY(fk_paciente) REFERENCES paciente (id_paciente)
);

-- inserir os registros
INSERT INTO medico (nome_medico, crm, telefone, email)
VALUES ("Otto", 54321, 85876547654, "otto@email.com");
INSERT INTO medico (nome_medico, crm, telefone, email)
VALUES ("Maria Caroline", 12345, 85876546484, "caroline@email.com");

INSERT INTO medico (nome_medico, crm, telefone, email)
VALUES 
("Gustavo Barros", 98746, 85873415884, "gustavo@email.com");
INSERT INTO medico (nome_medico, crm, telefone, email)
VALUES 
("Gustavo Joaquim", 89053, 85873464794, "gustavoj@email.com");

INSERT INTO paciente(nome_paciente, cpf, telefone, email)
VALUES 
("Joana D'Arc", 80976778634, 85987689089, "joana@email.com"),
("João Almeida", 75876778634, 85685689766, "joao@email.com"),
("Rogério Matos", 80976773104, 84336897656, "rogerio@email.com"),
("Ruth Barbosa", 00076778634, 87635000756, "ruth@email.com"),
("Guilherme Nogueira", 80976778600, 87635680006, "guinog@email.com"),
("Raimundo Braga", 80976771100, 87622897656, "raimundo@email.com"),
("Rian Mota", 80976700094, 87635680096, "rian@email.com"),
("Marcia Santana", 80999978634, 87635999656, "marcia@email.com"),
("Cleonaldo Santos", 80977778634, 87333687656, "cleon@email.com"),
("Rita Maria", 80976888634, 87658887656, "rita@email.com");

-- realizar as consultas
SELECT * FROM medico;
SELECT * FROM paciente;

-- nome e telefone
SELECT nome_paciente, telefone FROM paciente;
SELECT nome_medico, telefone FROM medico;

-- id
SELECT id_paciente, nome_paciente, email FROM paciente;
SELECT id_medico, nome_medico FROM medico;

-- update
UPDATE paciente SET email = "guilherme@email.com" WHERE id_paciente = 5;

-- deletar
DELETE FROM paciente WHERE id_paciente = 7;

INSERT INTO paciente (nome_paciente, cpf, telefone, email)
VALUES ("Ana Maria", 98909865435, 85987670987, "ana@email.com");