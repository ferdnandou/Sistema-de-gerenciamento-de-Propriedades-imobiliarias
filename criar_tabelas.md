# Criação do Banco de Dados e Tabelas

Este script cria o banco de dados `gerenciamento_imobiliario.db` e define as tabelas necessárias para o sistema de gerenciamento de propriedades imobiliárias.

```python
import sqlite3

# Conectar ao banco de dados (ou criar um novo se não existir)
conexao = sqlite3.connect('gerenciamento_imobiliario.db')
cursor = conexao.cursor()

# Criação da Tabela Propriedades
cursor.execute('''
CREATE TABLE IF NOT EXISTS Propriedades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    endereco TEXT,
    tipo TEXT CHECK(tipo IN ('casa', 'apartamento', 'terreno')),
    valor REAL,
    status TEXT CHECK(status IN ('disponível', 'vendido', 'alugado'))
);
''')

# Criação da Tabela Clientes
cursor.execute('''
CREATE TABLE IF NOT EXISTS Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    telefone TEXT,
    email TEXT,
    tipo_interesse TEXT CHECK(tipo_interesse IN ('compra', 'aluguel'))
);
''')

# Criação da Tabela Agentes
cursor.execute('''
CREATE TABLE IF NOT EXISTS Agentes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    telefone TEXT,
    email TEXT
);
''')

# Criação da Tabela Transações
cursor.execute('''
CREATE TABLE IF NOT EXISTS Transacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    agente_id INTEGER,
    propriedade_id INTEGER,
    data_transacao DATE,
    tipo_transacao TEXT CHECK(tipo_transacao IN ('compra', 'aluguel')),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (agente_id) REFERENCES Agentes(id),
    FOREIGN KEY (propriedade_id) REFERENCES Propriedades(id)
);
''')

print("Tabelas criadas com sucesso!")
