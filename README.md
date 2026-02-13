# <div align="center"> Sistema de Reservas de Salas</div>
<br>

# 🛠 Tecnologias utilizadas:
<br>
<div style="display: inline_block">
  <div align="center">
  <img align="center" alt="Docker" height="30" width="40" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original.svg">
   <img align="center" alt="CSS" height="30" width="40" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/dbeaver/dbeaver-original.svg">

</div>
<br>

# 💻  Sobre o Projeto:
<li>A empresa possui dezenas de salas distribuídas em seus prédios, usadas para reuniões, treinamentos e apresentações. Com o crescimento, tornou-se difícil coordenar reservas, evitar conflitos de agenda e garantir transparência.

**Missão:** Criar o design de um banco de dados para gerenciar reservas de salas, atendendo às necessidades de controle de usuários, departamentos, salas, reservas, lotação e histórico de alterações.


 </br>

# 📘 Ferramentas Utilizadas :
<ul>
        <li>Docker: O banco foi containerizado usando Docker para garantir portabilidade e facilidade de configuração.</li>
        <li>DBeaver: Utilizamos o DBeaver para conectar ao banco MySQL rodando no Docker, criar e gerenciar tabelas, chaves e triggers, visualizar e exportar o diagrama ER, executar queries de teste e popular o banco com dados.</li>
        
</ul>

# 🚀  Como subir o Projeto:
1. Clonar o repositório
2. Subir o container
3. Conectar via DBeaver:
  - Host: localhost
  - Porta: 3310
  - Usuário: usuario
  - Senha: senha
  - Banco: sistema_reservas_de_salas

# 📊 Estrutura do Banco de Dados:
1. **Departamentos** :

- Cada departamento possui um identificador único e um nome.
- Relaciona-se com os usuários.

2. **Usuários** :

- Funcionários da empresa.
- Cada usuário tem **nome** e **email** únicos.
- Pertence a um departamento

3. **Salas** :

- Cada sala possui **capacidade máxima** e **localização** única.
- São reservadas para o dia inteiro.

4. **Reservas** :

- Responsável por registrar quem reservou e qual sala.
- Garante que uma sala não pode ser reservada por mais de uma pessoa no mesmo dia.

5. **Booking** (Controle de Lotação) :

- Relaciona reservas com usuários participantes.
- Garante que não haja duplicidade de participantes.
- Deve respeitar a capacidade máxima da sala.

6. **Histórico** (Auditoria) :

- Registra todas as alterações realizadas nas reservas.
- Inclui quem fez a alteração e quando.

# 📑 Triggers de Auditoria :

- **AFTER INSERT** → registra criação (`CRIACAO`).
- **AFTER UPDATE** → registra atualização (`ATUALIZACAO`).
- **AFTER DELETE** → registra exclusão (`EXCLUSAO`).
  
# 📌 Observação :
 - Caso o usuário não possua permissão para criar Triggers no DBeaver, deve ser adicionada a seguinte linha ao serviço no arquivo docker-compose.yml: command: --log-bin-trust-function-creators=1. Essa configuração permite a criação de triggers e procedures sem a necessidade de privilégios adicionais.

# 🔄 Diagrama :
  <img width="518" height="555" alt="sistema_reservas_de_salas" src="https://github.com/user-attachments/assets/7bb473d2-ea9e-4141-ac1d-0903f5dc4285" />

