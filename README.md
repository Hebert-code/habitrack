[XCODE_BADGE]: https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white
[SWIFT__BADGE]: https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white
[CLOUDANT__BADGE]: https://img.shields.io/badge/Cloudant-000?style=for-the-badge&logo=ibm
[NODE_RED__BADGE]: https://img.shields.io/badge/Node--RED-8F0000?style=for-the-badge&logo=nodered
[FIGMA__BADGE]: https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white

<h1 align="center" style="font-weight: bold;">Habitrack 💻</h1>

![swift][SWIFT__BADGE]
![cloudant][CLOUDANT__BADGE]
![node-red][NODE_RED__BADGE]
![figma][FIGMA__BADGE]
![xcode][XCODE_BADGE]

<p align="center">
 <a href="#about">About</a> • 
 <a href="#started">Getting Started</a> • 
 <a href="#routes">App Routes</a> • 
 <a href="#colab">Collaborators</a> •
 <a href="#contribute">Contribute</a>
</p>

<p align="center">
    <img src="https://drive.google.com/file/d/1kNr5_Twzn7-uk9lhv6KZLAdiISHsQIwJ/view?usp=sharing" alt="Imagem" width="400px">
</p>

<h2 id="about">📌 About</h2>

**Habitrack** é um aplicativo desenvolvido durante o Hacktruck, uma imersão em tecnologias como SwiftUI, Cloudant, Figma e Node-RED. O objetivo do projeto é ajudar os usuários a construir e gerenciar metas e hábitos pessoais de forma eficiente. 

A solução proposta inclui:
- Cadastro de metas e hábitos.
- Gerenciamento do estado e progresso dos objetivos.
- Geração de relatórios e insights sobre o desempenho.

O projeto foi desenvolvido usando **SwiftUI** para o frontend, **Node-RED** para o backend e **Cloudant** como banco de dados. O protótipo foi projetado em **Figma**, e o processo de desenvolvimento incluiu a integração do frontend com o backend e o banco de dados, resultando em um sistema completo para gestão de hábitos.

<h2 id="started">🚀 Getting Started</h2>

Aqui estão as instruções para rodar o projeto localmente.

<h3>Pré-requisitos</h3>

Antes de começar, você precisará das seguintes ferramentas instaladas:

- [Node.js](https://nodejs.org/)
- [Swift](https://developer.apple.com/swift/)
- [Node-RED](https://nodered.org/docs/getting-started/)
- [Cloudant](https://www.ibm.com/cloud/cloudant) (ou uma conta IBM Cloud)
- [Git](https://git-scm.com/)

<h3>Clonagem</h3>

Para clonar o repositório, execute o seguinte comando:

```bash
git clone https://github.com/Hebert-code/habitrack.git
```
<h3>Começando</h3>
Navegue até a pasta do projeto:

```bash
cd habitrack
```
Instale as dependências do Node-RED (se aplicável):

```bash
npm install
```

Inicie o Node-RED:

```bash
node-red
```

Abra o projeto no Xcode para rodar o frontend em SwiftUI.

<h2 id="routes">📍 Application Routes</h2>
Aqui estão as principais rotas e funcionalidades do aplicativo:

| route                  | description                                          
|------------------------|-----------------------------------------------------
| <kbd>/habits</kbd>     |  Lista todos os hábitos cadastrados.
| <kbd>/habits/:id</kbd> |	Retorna um hábito específico pelo ID.
| <kbd>/habit</kbd>      |  Cria um novo hábito (POST).
| <kbd>/goals</kbd>      | 	Lista todas as metas cadastradas.
| <kbd>/goals/:id</kbd>  |  Retorna uma meta específica pelo ID.
| <kbd>/goal</kbd>       |  Cria uma nova meta (POST).
| <kbd>/reports</kbd>    |  Gera relatórios de progresso.


<h2 id="colab">🤝 Collaborators</h2>

Agradecimento especial a todos que contribuíram para este projeto.

<table> 

 <tr> <td align="center"> 
 <a href="https://github.com/Hebert-code"> <img src="https://avatars.githubusercontent.com/u/111450232?v=4" width="100px;" alt="Hebert Henrique"/><br> <sub> <b>Hebert Henrique</b> </sub> </a>
 
 </td> <td align="center"> <a href="https://github.com/CodeByBreno"> <img src="https://avatars.githubusercontent.com/u/132024181?v=4" width="100px;" alt="Breno Gabriel"/><br> <sub> <b>Breno Gabriel</b> </sub> </a> 
 
 </td> <td align="center"> <a href="https://github.com/DelioMg"> <img src="https://avatars.githubusercontent.com/u/97815194?v=4" width="100px;" alt="Délio"/><br> <sub> <b>Délio</b> </sub> </a> </td> </tr> </table>


<h2 id="contribute">📫 Contribute</h2>
Se você deseja contribuir com o projeto, siga os passos abaixo:

1. Faça um fork do repositório.

2. Crie uma branch para sua feature:
```bash
git checkout -b feature/nome-da-feature
```
Siga os padrões de commit.

Abra um Pull Request explicando a funcionalidade ou correção implementada. Se possível, inclua screenshots das modificações visuais.

<h3>Documentações que podem ajudar</h3>


[📝 How to create a Pull Request](https://www.atlassian.com/br/git/tutorials/making-a-pull-request)

[💾 Commit pattern](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

[📝 Node-RED Documentation](https://nodered.org/docs/)

[💾 Cloudant Documentation](https://cloud.ibm.com/docs/cloudant?topic=cloudant-getting-started)

[📝 SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/)

<!-- end list -->
