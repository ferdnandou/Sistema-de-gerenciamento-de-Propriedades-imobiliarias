
### 3. Exibição Gráfica dos Dados 

# Exibição Gráfica dos Dados

Este script exibe graficamente os dados das tabelas do banco de dados `gerenciamento_imobiliario.db` usando `matplotlib`.

```python
import sqlite3
import matplotlib.pyplot as plt

# Conectar ao banco de dados
conexao = sqlite3.connect('gerenciamento_imobiliario.db')
cursor = conexao.cursor()

# Consulta para o gráfico de barras - Propriedades por status
cursor.execute('''
SELECT status, COUNT(*) FROM Propriedades GROUP BY status
''')
dados_propriedades = cursor.fetchall()
status, contagem = zip(*dados_propriedades)

plt.figure(figsize=(10, 5))
plt.bar(status, contagem, color=['green', 'red', 'blue'])
plt.xlabel('Status')
plt.ylabel('Número de Propriedades')
plt.title('Número de Propriedades por Status')
plt.show()

# Consulta para o gráfico de pizza - Tipo de interesse dos clientes
cursor.execute('''
SELECT tipo_interesse, COUNT(*) FROM Clientes GROUP BY tipo_interesse
''')
dados_clientes = cursor.fetchall()
tipos, contagem = zip(*dados_clientes)

plt.figure(figsize=(8, 8))
plt.pie(contagem, labels=tipos, autopct='%1.1f%%', colors=['gold', 'lightcoral'])
plt.title('Distribuição do Tipo de Interesse dos Clientes')
plt.show()

# Fechar a conexão
conexao.close()
