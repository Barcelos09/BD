/*
Nome: João Pedro Barcelos Lacerda
RA: 140977
BD - Musa
*/
/*
Ex1
*/
CREATE DATABASE EX;

CREATE TABLE ATOR (
                    coda integer,
                    nomeart varchar(25),
                    nomereal varchar(25),
                    nacionalidade varchar(25),
                    sexo char,
                    indicacoesoscar integer,
                    num_oscar integer,
                Primary key(coda));

Create table FILME (
                    codf integer,
                    nome varchar(20),
                    ano date,
                    orcamento float,
                    tempo float,
                Primary key(codf));
                
Create table PERSONAGEM (
                        coda integer,
                        codf integer,
                        personagem varchar(25),
                        cache float,
                    primary key(coda, codf),
                    foreign key(coda) REFERENCES ATOR(coda),
                    foreign key(codf) REFERENCES FILME(codf));
/*
Ex 2
*/
                    
INSERT INTO ATOR(coda, nomeart, nomereal, nacionalidade, sexo, indicacoes_oscar, num_oscar)
VALUES 	
	(1, "Demi Moore", "Mariada Silva", "USA", "f", 0, 0),
	(2, "Brad Pitt", "Joao Paulo", "USA", "f", 1, 0),
	(3, "Dustin Hoffmann", "Dustin Hoffman", "USA", "m", 2, 0),
	(4, "Jessica Lange", "Jessica Lange", "USA", "f", 4, 2),
	(5, "Sonia Braga", "Sonia Braga", "Brazil", "f", 0, 0);
        
INSERT INTO FILME(codf, nome, ano, orcamento, tempo)
VALUES 	
	(1, "A Jurada", 1996, 1000000, 18),
	(2, "A Letra Escarlate", 1995, 10000000, 24),
	(3, "Seven", 1995, 1500000, 20),
	(4, "Tootsie", 1982, 50000, 16),
	(5, "Tieta", 1995, 200000, 18);

INSERT INTO PERSONAGEM(coda, codf, personagem, cache)
VALUES 	
	(1, 1, "Mary", 3000),
	(1, 2, "Sandy", 5000),
	(2, 3, "John", 5000),
	(3, 4, "Mary", 1000),
	(4, 4, "Tootsie", 2000),
	(5, 5, "Tieta", 500);

UPDATE ATOR SET sexo = "m" WHERE coda = 2;

UPDATE PERSONAGEM SET cache = cache * 1.01 WHERE coda >=1;

DELETE FROM FILME WHERE codf = 5;
/* Não é possível excluir esse filme pois ele está sendo referenciado na tabela PERSONAGEM como uma chave estrangeira. */
/*
Error Code: 1451. Cannot delete or update a parent row:
a foreign key constraint fails (`exercicio1`.`personagem`, CONSTRAINT `personagem_ibfk_2` FOREIGN KEY (`codf`) REFERENCES `filme` (`codf`)) 
*/

DELETE FROM PERSONAGEM WHERE coda = 4 AND codf = 4;
/* É possível, pois esse personagem não está sendo referenciado em outra tabela.*/

