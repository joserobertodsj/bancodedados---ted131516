--DROP DATABASE
DROP DATABASE AULA_BDI_221;

-- Criação do Banco de Dados
CREATE DATABASE AULA_BDI_221;

-- Definir qual banco de dados vamos utilizar
USE AULA_BDI_221;
GO

-- TABELA PRODUTOS
DROP TABLE DBO.PRODUTO;
GO

CREATE TABLE PRODUTO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50),
	DESCRICAO VARCHAR(255),
	TIPO CHAR(1),
	VALOR DECIMAL(5,2),
	CONSTRAINT PK_PRODUTO PRIMARY KEY(ID)
);
GO

-- TABELA FORMA DE PAGAMENTO
DROP TABLE FORMA_PAGAMENTO;
GO

CREATE TABLE FORMA_PAGAMENTO(
	ID INT IDENTITY(1,1) NOT NULL,
	DESCRICAO VARCHAR(50) NOT NULL,
	CONSTRAINT PK_FORMA_PAGAMENTO PRIMARY KEY(ID)
);
GO

-- TABELA FUNCIONARIO
DROP TABLE FUNCIONARIO;
GO

CREATE TABLE FUNCIONARIO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SALARIO DECIMAL(6,2) NOT NULL,
	-- COD ENDERECO
	TIPO CHAR(1) NULL,
	N_CONSELHO INT NULL,
	ESPECIALIDADE VARCHAR(20) NULL,
	COMISSAO DECIMAL(4,2),
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID)
);
GO

-- TABELA CLIENTE
DROP TABLE CLIENTE;
GO

CREATE TABLE CLIENTE(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	-- COD_ENDERECO
	-- TELEFONE
	EMAIL VARCHAR(50) NOT NULL,
	CONSTRAINT PK_CLIENTE PRIMARY KEY(ID)
);
GO

-- TABELA PRONTUARIO
DROP TABLE PRONTUARIO;
GO

CREATE TABLE PRONTUARIO (
	ID INT IDENTITY(1,1) NOT NULL,
	DESCRICAO VARCHAR(255),
	TEMPERATURA DECIMAL(3,1),
	PESO DECIMAL(3,1),
	CONSTRAINT PK_PRONTUARIO PRIMARY KEY(ID)
);
GO

-- TABELA PET
DROP TABLE PET;
GO

CREATE TABLE PET(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50),
	ESPECIE VARCHAR(50),
	PORTE VARCHAR(50),
	DT_NASC DATE,
	ID_PRONTUARIO INT NULL,
	CONSTRAINT PK_PET PRIMARY KEY(ID),
	CONSTRAINT FK_PET_PRONTUARIO FOREIGN KEY(ID_PRONTUARIO)
	REFERENCES DBO.PRONTUARIO (ID)
);
GO

-- TABELA CLIENTE-PET
DROP TABLE CLIENTE_PET;
GO

CREATE TABLE CLIENTE_PET(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_PET INT NOT NULL,
	CONSTRAINT PK_CLIENTE_PET PRIMARY KEY(ID),
	CONSTRAINT FK_CLIENTE_PET_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE (ID),
	CONSTRAINT FK_CLIENTE_PET_PET FOREIGN KEY (ID_PET)
	REFERENCES DBO.PET (ID)
);
GO

-- TABELA VENDA
DROP TABLE VENDA;
GO

CREATE TABLE VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_FORMA_PAGAMENTO INT NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_FUNCIONARIO INT NOT NULL,
	CONSTRAINT PK_VENDA PRIMARY KEY(ID),
	CONSTRAINT FK_VENDA_FORMA_PAGAMENTO FOREIGN KEY(ID_FORMA_PAGAMENTO)
	REFERENCES DBO.FORMA_PAGAMENTO (ID),
	CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE (ID),
	CONSTRAINT FK_vENDA_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO (ID)
);
GO

-- TABELA PRODUTO_VENDA
DROP TABLE PRODUTO_VENDA;
GO

CREATE TABLE PRODUTO_VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_PRODUTO INT NOT NULL,
	ID_VENDA INT NOT NULL,
	CONSTRAINT PK_PRODUTO_VENDA PRIMARY KEY(ID, ID_PRODUTO, ID_VENDA),
	CONSTRAINT FK_PRODUTO_VENDA_PRODUTO FOREIGN KEY (ID_PRODUTO)
	REFERENCES DBO.PRODUTO (ID),
	CONSTRAINT FK_PRODUTO_VENDA_VENDA FOREIGN KEY (ID_VENDA)
	REFERENCES DBO.VENDA (ID)
);
GO

-- INSERT FORMAS DE PAGAMENTO

DELETE FROM DBO.FORMA_PAGAMENTO;
DBCC CHECKIDENT ('FORMA_PAGAMENTO', RESEED, 0);
GO

INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Dinheiro');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Débito');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Crédito (Vencimento)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Crédito (Parcelado)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Carnê');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Pix');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('PicPay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Google Pay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Mercado Pago');

SELECT * FROM DBO.FORMA_PAGAMENTO;

-- TABELA PRODUTO

DELETE FROM DBO.PRODUTO;
DBCC CHECKIDENT ('PRODUTO', RESEED, 0);
GO

INSERT INTO DBO.PRODUTO VALUES
('Bola de brinquedo', 'Bola para morder e pegar para cachorros', 'P', 10.00);
INSERT INTO DBO.PRODUTO VALUES
('Shampo Pet Love', 'Para um banho cheiroso', 'P', 13.00);
INSERT INTO DBO.PRODUTO VALUES
('Banho e Tosa', 'Serviço de estética', 'S', 60.00);
INSERT INTO DBO.PRODUTO VALUES
('Coleira', 'Segurança para seu pet', 'P', 66.90);
INSERT INTO DBO.PRODUTO VALUES
('Consulta Veterinária', 'Consulta especializada', 'S', 299.90);
INSERT INTO DBO.PRODUTO VALUES
('Ração Atacama 16kg', 'Ração boa pra cachorro', 'P', 230.99);
INSERT INTO DBO.PRODUTO VALUES
('Bola de brinquedo', 'Bola para morder e pegar para cachorros', 'P', 10.00);
INSERT INTO DBO.PRODUTO VALUES
('Catnip 10g', 'Erva de gato desidratada', 'P', 25.98);
INSERT INTO DBO.PRODUTO VALUES
('Pedras de fire', 'Ração crocante e flamejante', 'P', 15.50);
INSERT INTO DBO.PRODUTO VALUES
('Remedio pulkill', 'Matar pulga ', 'P', 90.81);
INSERT INTO DBO.PRODUTO VALUES
('Ração Wiskas', 'Ração para gatos', 'P', 20.87);
INSERT INTO DBO.PRODUTO VALUES
('Correntes de Asgard ', 'Correntes que prederam o lobo Fenrir de Asgard', 'P', 88.90);
INSERT INTO DBO.PRODUTO VALUES
('Sampoo Premium', 'Shampoo da linha premium para pelos sedosos', 'P', 250.87);
INSERT INTO DBO.PRODUTO VALUES
('Raçães Pilar', 'Comida de cachorro', 'P', 88.90);
INSERT INTO DBO.PRODUTO VALUES
('Mordedor', 'Mordedor para cachorro de grande porte', 'P', 58.90);
INSERT INTO DBO.PRODUTO VALUES
('Ração mania', 'Comida de cachorro', 'P', 58.91);
INSERT INTO DBO.PRODUTO VALUES
('Osso Roedor', 'Ossinho de roer para cachorro inquieto', 'P', 58.92);
INSERT INTO DBO.PRODUTO VALUES
('Gaiola roedores', 'Gaiola para pequenos roedores - tamanho medio ', 'P', 58.93);

SELECT * FROM DBO.PRODUTO;

-- TABELA CLIENTES

DELETE FROM DBO.CLIENTE;
DBCC CHECKIDENT ('CLIENTE', RESEED, 0);
GO

INSERT INTO DBO.CLIENTE VALUES
('Levi de Souza Folly', 'levi.folly@geradornv.com.br'),
('Everton Cormack Siqueira', 'everton.siqueira@geradornv.com.br'),
('Estefani Guimarães Claudino', 'estefani.claudino@geradornv.com.br'),
('Alessandro Temperini Antunes', 'alessandro.antunes@geradornv.com.br'),
('Islayne Hall Mourão', 'islayne.mourao@geradornv.com.br'),
('Jonathan Branco Zuniga', 'jonathan.zuniga@geradornv.com.br'),
('Rozangela de Barros Queiroz', 'rozangela.queiroz@geradornv.com.br'),
('Katyene da Conceição Bravo', 'katyene.bravo@geradornv.com.br'),
('Débora Matta Valente', 'debora.valente@geradornv.com.br'),
('Hebert Cardoso Filho', 'hebert.filho@geradornv.com.br'),
('Emanoel Pires Lana', 'emanoel.lana@geradornv.com.br'),
('Eliana Branco Gomes', 'eliana.gomes@geradornv.com.br'),
('Lucy da Cunha Carmanin', 'lucy.carmanin@geradornv.com.br'),
('Vilma Sarmento Sarmanto', 'vilma.sarmanto@geradornv.com.br');

SELECT * FROM DBO.CLIENTE;

-- TABELA FUNCIONÁRIOS

DELETE FROM DBO.FUNCIONARIO;
DBCC CHECKIDENT ('FUNCIONARIO', RESEED, 0);
GO

ALTER TABLE DBO.FUNCIONARIO
ALTER COLUMN CPF VARCHAR(14);

INSERT INTO DBO.FUNCIONARIO VALUES
('Rosimere Theodoro Manhães', '387.867.049-40', 2500.00, 'V', 696432, 'Geral', NULL),
('José Da Silva', '798.783.146-65', 5000.00, 'V', 23456789, 'Dermatologia', NULL),
('Osmar Osvaldo', '111.222.333-04', 2500.00, 'V', 7632198, 'Geral', NULL),
('Hermenegildo Batista', '552.443.644-76', 3500.00, 'V', 6743856, 'Oncologista', NULL),
('Joaquim Da Silva Santos', '121.077.452-85', 9785.00, 'V', 675897, 'Oncologista', NULL),
('Pedro Thomas Monteiro', '567.659.342-35', 3000, 'V', 21423, 'Dermatologia', NULL),
('João Lima', '777.949.230-34', 1310.17, 'A', NULL, NULL, 7),       
('Jeniffer Batista', '189.684.123-99', 1580.25, 'A', NULL, NULL, 11),
('Aline Omar', '400.289.221-88', 1367.80, 'A', NULL, NULL, 8);

SELECT * FROM DBO.FUNCIONARIO;

-- TABELA PETS

DELETE FROM PET;
DBCC CHECKIDENT ('PET', RESEED, 0);
GO

INSERT INTO DBO.PET VALUES
('Marley', 'Cachorro', 'M', NULL, NULL),
('Dogão', 'Cachorro', 'P', NULL, NULL),
('Simba', 'Gato', 'M', NULL, NULL),
('Kira Maria', 'Gato', 'M', NULL, NULL),
('Ligerinho', 'Jabuti', 'P', NULL, NULL),
('Toíco', 'Papagaio', 'M', NULL, NULL),
('Judith Pereira', 'Gato', 'M', NULL, NULL),
('Nine', 'Cachorro', 'M', NULL, NULL),
('Teddy', 'Cachorro', 'P', NULL, NULL);

SELECT * FROM DBO.PET;

-- INSERINDO VENDAS
DELETE FROM DBO.VENDA;
DBCC CHECKIDENT ('VENDA', RESEED, 0);
GO

INSERT INTO DBO.VENDA VALUES(1, 1, 7);
INSERT INTO DBO.VENDA VALUES(6, 3, 9);
INSERT INTO DBO.VENDA VALUES(6, 13, 8);
INSERT INTO DBO.VENDA VALUES(1, 4, 7);
INSERT INTO DBO.VENDA VALUES(3, 13, 9);
INSERT INTO DBO.VENDA VALUES(6, 8, 7);
INSERT INTO DBO.VENDA VALUES(1, 1, 9);
INSERT INTO DBO.VENDA VALUES(3, 4, 8);
INSERT INTO DBO.VENDA VALUES(1, 13, 7);

SELECT * FROM DBO.VENDA;

-- INSERINDO PRODUTOS VENDIDOS
DELETE FROM DBO.PRODUTO_VENDA;
DBCC CHECKIDENT ('PRODUTO_VENDA', RESEED, 0);
GO

INSERT INTO DBO.PRODUTO_VENDA VALUES
(6, 1),
(5, 1),
(7, 1);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(2, 2),
(5, 2);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(6, 3),
(9, 3),
(4, 3),
(7, 3);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(10, 4);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(12, 5);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(17, 6),
(14, 6);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(7, 7);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(17, 8);

INSERT INTO DBO.PRODUTO_VENDA VALUES
(9, 9);


-- Questões

-- Quais vendas foram pagas em dinheiro?
SELECT
	V.ID AS ID_VENDA,
	FP.DESCRICAO AS DESCRICAO_FORMA_PAGAMENTO
FROM VENDA AS V
INNER JOIN FORMA_PAGAMENTO AS FP
	ON V.ID_FORMA_PAGAMENTO = FP.ID
WHERE DESCRICAO = 'DINHEIRO';

-- Quais os tipos de venda de cada produto?
SELECT
	PV.ID AS ID_VENDA,
	P.TIPO AS TIPO_PRODUTO
FROM PRODUTO_VENDA AS PV
INNER JOIN PRODUTO AS P
	ON PV.ID_PRODUTO = P.ID;

-- Quais são os pets com especie 'cachorro' cadastrados no petshop?
SELECT NOME, ESPECIE FROM PET WHERE ESPECIE = 'CACHORRO';

-- Quais pets são de porte médio?
SELECT NOME, ESPECIE FROM PET
GROUP BY NOME, ESPECIE, PORTE
HAVING PORTE = 'M'

-- Quantas vendas foram feitas por cada vendedor/atendente?
SELECT
	F.NOME,
	COUNT(P.VALOR) AS VALOR_VENDA
FROM PRODUTO AS P
INNER JOIN PRODUTO_VENDA AS PV
	ON P.ID = PV.ID_PRODUTO
INNER JOIN VENDA AS V
	ON PV.ID_VENDA = V.ID
INNER JOIN FUNCIONARIO AS A
	ON V.ID_FUNCIONARIO = A.ID
GROUP BY A.NOME
ORDER BY VALOR_VENDA ASC;

-- Quais são as espécies da tabela pet? 
SELECT DISTINCT ESPECIE FROM PET;