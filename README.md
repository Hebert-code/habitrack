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
    <img src="![Image](https://github.com/user-attachments/assets/6792e861-8652-48fc-9e97-25c2c3b47753)" alt="Imagem" width="400px">
</p>

<h2 id="about">📌 About</h2>

**Habitrack** is an application developed during Hacktruck, an immersion in technologies such as SwiftUI, Cloudant, Figma, and Node-RED. The goal of the project is to help users build and manage personal goals and habits efficiently.

The proposed solution includes:
- Registration of goals and habits.
- Management of the state and progress of objectives.
- Generation of reports and insights on performance.

The project was developed using **SwiftUI** for the frontend, **Node-RED** for the backend and **Cloudant** as the database. The prototype was designed in **Figma**, and the development process included integrating the frontend with the backend and the database, resulting in a complete system for habit management.

<h2 id="started">🚀 Getting Started</h2>

Here are the instructions to run the project locally.

<h3>Prerequisites</h3>

Before starting, you will need the following tools installed:

- [Node.js](https://nodejs.org/)
- [Swift](https://developer.apple.com/swift/)
- [Node-RED](https://nodered.org/docs/getting-started/)
- [Cloudant](https://www.ibm.com/cloud/cloudant) (or an IBM Cloud account)
- [Git](https://git-scm.com/)

<h3>Cloning</h3>

To clone the repository, run the following command:

```bash
git clone https://github.com/Hebert-code/habitrack.git
```
<h3>Getting Started</h3>
Navigate to the project folder:

```bash
cd habitrack
```
Install Node-RED dependencies (if applicable):

```bash
npm install
```

Start Node-RED:

```bash
node-red
```

Open the project in Xcode to run the SwiftUI frontend.

<h2 id="routes">📍 Application Routes</h2>
Here are the main routes and functionalities of the application:

| route                  | description                                          
|------------------------|-----------------------------------------------------
| <kbd>/habits</kbd>     |  Lists all registered habits.
| <kbd>/habits/:id</kbd> | 	Returns a specific habit by ID.
| <kbd>/habit</kbd>      |  Creates a new habit (POST).
| <kbd>/goals</kbd>      |  Lists all registered goals.
| <kbd>/goals/:id</kbd>  |  Returns a specific goal by ID.
| <kbd>/goal</kbd>       |  Creates a new goal (POST).
| <kbd>/reports</kbd>    |  Generates progress reports.


<h2 id="colab">🤝 Collaborators</h2>

Special thanks to everyone who contributed to this project.

<table> 

 <tr> <td align="center"> 
 <a href="https://github.com/Hebert-code"> <img src="https://avatars.githubusercontent.com/u/111450232?v=4" width="100px;" alt="Hebert Henrique"/><br> <sub> <b>Hebert Henrique</b> </sub> </a>
 
 </td> <td align="center"> <a href="https://github.com/CodeByBreno"> <img src="https://avatars.githubusercontent.com/u/132024181?v=4" width="100px;" alt="Breno Gabriel"/><br> <sub> <b>Breno Gabriel</b> </sub> </a> 
 
 </td> <td align="center"> <a href="https://github.com/DelioMg"> <img src="https://avatars.githubusercontent.com/u/97815194?v=4" width="100px;" alt="Délio"/><br> <sub> <b>Délio</b> </sub> </a> </td> </tr> </table>


<h2 id="contribute">📫 Contribute</h2>
If you wish to contribute to the project, follow the steps below:

1. Fork the repository.

2. Create a branch for your feature:
```bash
git checkout -b feature/nome-da-feature
```
Follow the commit patterns.

Open a Pull Request explaining the functionality or fix implemented. If possible, include screenshots of visual changes.

<h3>Documentations that may help</h3>


[📝 How to create a Pull Request](https://www.atlassian.com/br/git/tutorials/making-a-pull-request)

[💾 Commit pattern](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

[📝 Node-RED Documentation](https://nodered.org/docs/)

[💾 Cloudant Documentation](https://cloud.ibm.com/docs/cloudant?topic=cloudant-getting-started)

[📝 SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/)

<!-- end list -->
