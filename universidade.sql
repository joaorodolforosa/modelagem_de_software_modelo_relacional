CREATE DATABASE A;
USE A;
CREATE TABLE Alunos (id_aluno CHAR(20), nome CHAR(20), login CHAR(20), idade INTEGER, media REAL);
INSERT INTO Alunos (id_aluno, nome, login, idade, media) VALUES (53688, 'Smith', 'smith@ee', 18, 3.2);
DELETE FROM Alunos A  WHERE A.nome='Smith';
UPDATE Alunos A
	SET A.media=A.media+2
	WHERE A.id_aluno=53688;
UPDATE Alunos A
	SET A.media=A.media-0.1
    WHERE A.media >=3.3;
DROP TABLE Alunos;
CREATE TABLE Alunos (id_aluno CHAR(20),
					nome CHAR(30),
                    login CHAR(20),
                    idade INTEGER,
                    media REAL,
                    UNIQUE (nome, idade),
                    CONSTRAINT PRIMARY KEY (id_aluno));
CREATE TABLE Matriculado (id_aluno CHAR(20),
						id_curso CHAR(20),
                        nota CHAR(20),
                        PRIMARY KEY (id_aluno, id_curso),
                        FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno));
INSERT INTO Matriculado (id_aluno, id_curso, nota)
	VALUES (55555, 'Art104', 'A');
INSERT INTO Alunos (id_aluno, nome, login, idade, media)
	VALUES (53688, 'Mike', 'mike@ee', 17, 3.4);
INSERT INTO Alunos (id_aluno, nome, login, idade, media)
	VALUES (null, 'Mike', 'mike@ee', 17, 3.4);
INSERT INTO Alunos (id_aluno, nome, login, idade, media)
	VALUES (50000, 'Dave', 'dave@cs', 19, 3.3);
UPDATE Alunos a
	SET A.id_aluno = 50000
    WHERE A.id_aluno = 53688;
DELETE FROM Alunos A  WHERE A.id_aluno='53688';
INSERT INTO Alunos (id_aluno, nome, login, idade, media)
	VALUES (53688, 'Smith', 'smith@ee', 18, 3.2);
INSERT INTO Matriculado (id_aluno, id_curso, nota)
	VALUES (53688, 'Topology112', 'A');
DELETE FROM Alunos A WHERE A.id_aluno='53688';
UPDATE Alunos A
	SET A.id_aluno = 53687
    WHERE A.id_aluno = 53688;
DROP TABLE Matriculado;
DROP TABLE Alunos;
CREATE TABLE Alunos (
	id_aluno CHAR(20),
    nome CHAR(30),
    login CHAR(20),
    idade INTEGER,
    media REAL,
    UNIQUE (nome, idade),
    CONSTRAINT PRIMARY KEY Alunos(id_aluno));
CREATE TABLE Matriculado (
	id_aluno CHAR(20),
    id_curso CHAR(20),
    nota CHAR(10),
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
		ON DELETE CASCADE
        ON UPDATE NO ACTION);
INSERT
	INTO Alunos (id_aluno, nome, login, idade, media)
    VALUES (53688, 'Smith', 'smith@ee', 18, 3.2);
INSERT
	INTO Alunos (id_aluno, nome, login, idade, media) VALUES
		(50000, 'Dave', 'dave@cs', 19, 3.3),
		(53666, 'Jones', 'jones@cs', 18, 3.4),
        (53650, 'Smith', 'smith@math', 19, 3.8),
        (53831, 'Madayan', 'madayan@music', 11, 1.8),
        (53832, 'Guldu', 'guldu@music', 12, 20);
INSERT
	INTO Matriculado (id_curso, nota, id_aluno) VALUES
		('Carnatic101', 'C', 53688),
        ('Reggae203', 'C', 53832),
        ('Topology', 'A', '53650'),
        ('History105', 'B', '53666');
SELECT *
	FROM Alunos A
    WHERE A.idade < 18;
SELECT A.nome, A.login
	FROM Alunos A
    WHERE A.idade < 18;
SELECT A.nome, M.id_curso
	FROM Alunos A, Matriculado M
    WHERE A.id_aluno = M.id_aluno AND M.nota = 'A';
SELECT A.nome, M.id_curso
	FROM Alunos A, Matriculado M
    WHERE A.id_aluno = M.id_aluno AND M.nota = 'C';
		
USE a;
CREATE VIEW Estudantes_B (nome, id_aluno, curso)
	AS SELECT A.nome, A.id_aluno, M.id_curso
    FROM Alunos A, Matriculado M
    WHERE A.id_aluno = M.id_aluno AND M.nota = 'B';

UPDATE Matriculado M
	SET M.nota = 'B'
    WHERE M.id_aluno = 53832;

CREATE TABLE Clubes (
	nomec CHAR(20),
    ano_filiacao DATE,
    nomem CHAR(20));

CREATE VIEW EstudantesAtivos (nome, login, clube, desde)
	AS SELECT A.nome, A.login, C.nomec, C.ano_filiacao
    FROM Alunos A, Clubes C
    WHERE A.nome = C.nomem AND A.media > 3;
    
INSERT INTO Clubes (nomec, ano_filiacao, nomem) VALUES
	('Sailing', '1996-01-01', 'Dave'),
    ('Hiking', '1997-01-01', 'Smith'),
    ('Rowing', '1998-01-01', 'Smith');