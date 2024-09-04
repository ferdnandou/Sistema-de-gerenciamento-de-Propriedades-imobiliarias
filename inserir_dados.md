
### 2. Inserção de Dados nas Tabelas

```markdown
# Inserção de Dados nas Tabelas

Este script insere dados fictícios nas tabelas do banco de dados `gerenciamento_imobiliario.db`.

```python
import sqlite3

# Conectar ao banco de dados
conexao = sqlite3.connect('gerenciamento_imobiliario.db')
cursor = conexao.cursor()

# Inserção de dados na tabela Propriedades
cursor.executemany('''
INSERT INTO Propriedades (endereco, tipo, valor, status) VALUES (?, ?, ?, ?)
''', [
    ('Rua A, 123', 'casa', 300000.00, 'disponível'),
    ('Avenida B, 456', 'apartamento', 250000.00, 'vendido'),
    ('Estrada C, 789', 'terreno', 150000.00, 'alugado'),
    ('Rua D, 321', 'casa', 400000.00, 'disponível')
])

# Inserção de dados na tabela Clientes
cursor.executemany('''
INSERT INTO Clientes (nome, telefone, email, tipo_interesse) VALUES (?, ?, ?, ?)
''', [
    ('João Silva', '11999999999', 'joao@example.com', 'compra'),
    ('Maria Souza', '11888888888', 'maria@example.com', 'aluguel'),
    ('Carlos Santos', '11777777777', 'carlos@example.com', 'compra')
])

# Inserção de dados na tabela Agentes
cursor.executemany('''
INSERT INTO Agentes (nome, telefone, email) VALUES (?, ?, ?)
''', [
    ('Carlos Oliveira', '11777777777', 'carlos@example.com'),
    ('Ana Paula', '11666666666', 'ana@example.com')
])

# Inserção de dados na tabela Transações
cursor.executemany('''
INSERT INTO Transacoes (cliente_id, agente_id, propriedade_id, data_transacao, tipo_transacao) VALUES (?, ?, ?, ?, ?)
''', [
    (1, 1, 1, '2024-09-01', 'compra'),
    (2, 2, 3, '2024-09-02', 'aluguel')
])

# Commit para salvar as mudanças
conexao.commit()
conexao.close()

print("Dados inseridos com sucesso!")
