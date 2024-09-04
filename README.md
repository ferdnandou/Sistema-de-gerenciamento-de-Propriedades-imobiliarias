# Sistema de Gerenciamento de Propriedades Imobiliárias

Este projeto é um sistema básico para gerenciar propriedades imobiliárias usando Python e SQLite. Ele inclui a criação de tabelas no banco de dados, inserção de dados e visualização gráfica das informações.

## Estrutura do Projeto

O projeto está dividido em três partes principais:

1. **Criação das Tabelas** - Criação do banco de dados e das tabelas para armazenar informações sobre propriedades, clientes, agentes e transações.
2. **Inserção de Dados** - Inserção de dados fictícios nas tabelas criadas.
3. **Exibição Gráfica** - Visualização gráfica dos dados usando `matplotlib`.

## Requisitos

- Python 3.x
- SQLite
- Bibliotecas Python:
  - `matplotlib`

## Instalação

1. Clone o repositório:

    ```bash
    git clone https://github.com/seu-usuario/gerenciamento-imobiliario.git
    cd gerenciamento-imobiliario
    ```

2. Instale as dependências:

    ```bash
    pip install matplotlib
    ```

## Uso

### 1. Criação das Tabelas

Execute o script `criar_tabelas.py` para criar o banco de dados e as tabelas.

```bash
python criar_tabelas.py
```

### 2. Inserção de Dados

Execute o script `inserir_dados.py` para adicionar dados fictícios nas tabelas.

```bash
python inserir_dados.py
```

### 3. Exibição Gráfica

Execute o script `exibir_graficos.py` para visualizar graficamente os dados.

```bash
python exibir_graficos.py
```

## Estrutura dos Arquivos

- `criar_tabelas.py` - Script para criar o banco de dados e tabelas.
- `inserir_dados.py` - Script para inserir dados nas tabelas.
- `exibir_graficos.py` - Script para gerar gráficos com os dados.
- `README.md` - Documentação do projeto.
- `.gitignore` - Arquivo para ignorar arquivos desnecessários no repositório.

- **`criar_tabelas.py`**: Código para criar o banco de dados e as tabelas.
- **`inserir_dados.py`**: Código para inserir dados fictícios nas tabelas.
- **`exibir_graficos.py`**: Código para exibir graficamente os dados do banco.
- **`README.md`**: Documentação completa do projeto.
- **`.gitignore`**: Configuração para ignorar arquivos indesejados no repositório.
