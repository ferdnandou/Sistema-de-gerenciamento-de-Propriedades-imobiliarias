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
