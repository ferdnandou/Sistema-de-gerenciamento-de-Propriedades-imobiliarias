CREATE DATABASE imobiliaria;

USE imobiliaria;

CREATE TABLE Propriedades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(255),
    tipo ENUM('casa', 'apartamento', 'terreno'),
    valor DECIMAL(10, 2),
    status ENUM('disponível', 'vendido', 'alugado'),
    INDEX idx_status (status)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100),
    tipo_interesse ENUM('compra', 'aluguel')
);

CREATE TABLE Agentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Transacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    agente_id INT,
    propriedade_id INT,
    data_transacao DATE,
    tipo_transacao ENUM('compra', 'aluguel'),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (agente_id) REFERENCES Agentes(id),
    FOREIGN KEY (propriedade_id) REFERENCES Propriedades(id),
    INDEX idx_tipo_transacao (tipo_transacao)
);

ALTER TABLE Propriedades
ADD CONSTRAINT chk_status CHECK (status IN ('disponível', 'vendido', 'alugado'));

INSERT INTO Propriedades (endereco, tipo, valor, status) VALUES
('Rua A, 123', 'casa', 300000.00, 'disponível'),
('Avenida B, 456', 'apartamento', 250000.00, 'vendido'),
('Estrada C, 789', 'terreno', 150000.00, 'alugado');

INSERT INTO Clientes (nome, telefone, email, tipo_interesse) VALUES
('João Silva', '11999999999', 'joao@example.com', 'compra'),
('Maria Souza', '11888888888', 'maria@example.com', 'aluguel');

INSERT INTO Agentes (nome, telefone, email) VALUES
('Carlos Oliveira', '11777777777', 'carlos@example.com'),
('Ana Paula', '11666666666', 'ana@example.com');

INSERT INTO Transacoes (cliente_id, agente_id, propriedade_id, data_transacao, tipo_transacao) VALUES
(1, 1, 1, '2024-09-01', 'compra'),
(2, 2, 3, '2024-09-02', 'aluguel');

-- Listar todas as propriedades disponíveis
SELECT * FROM Propriedades WHERE status = 'disponível';

-- Listar todas as transações de compra
SELECT * FROM Transacoes WHERE tipo_transacao = 'compra';

-- Consultar detalhes completos de uma transação
SELECT 
    Transacoes.id, 
    Clientes.nome AS cliente_nome, 
    Agentes.nome AS agente_nome, 
    Propriedades.endereco 
FROM 
    Transacoes
JOIN Clientes ON Transacoes.cliente_id = Clientes.id
JOIN Agentes ON Transacoes.agente_id = Agentes.id
JOIN Propriedades ON Transacoes.propriedade_id = Propriedades.id;

-- Alterar o status de uma propriedade para "Vendido"
BEGIN TRANSACTION;
UPDATE Propriedades SET status = 'vendido' WHERE id = 1;
INSERT INTO Transacoes (cliente_id, agente_id, propriedade_id, data_transacao, tipo_transacao) VALUES (1, 1, 1, '2024-09-01', 'compra');
COMMIT;

-- Atualizar o número de telefone de um cliente
UPDATE Clientes SET telefone = '11911111111' WHERE id = 1;

-- Remover um cliente
DELETE FROM Clientes WHERE id = 2;

-- Excluir uma propriedade
DELETE FROM Propriedades WHERE id = 3;
