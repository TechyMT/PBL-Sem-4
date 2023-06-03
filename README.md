<div align="center">
  <img src="https://github.com/TechyMT/PBL-Sem-4/blob/e06a1b8f1abe005d6f8d4999b9f37089a2938bde/public/logo.png"/>
  </div>

# PrintEZ

Are you tired of the chaos and long queues at the stationery during submission time or on any regular day? Introducing PrintEZ, an app-based portal designed to streamline the printing process and eliminate the hassle of crowded stationeries. We've also developed a web-based portal specifically for the receivers at the stationery. This portal provides them with a comprehensive overview of incoming print requests, allowing them to manage and prioritize tasks effectively. With the PrintEZ receiver portal, stationery staff can now process print jobs seamlessly, even check through the history of printed documents to keep track of prints, thus reducing chaos and improving overall efficiency.




## Links

- [App Portal Branch](https://github.com/TechyMT/PBL-Sem-4/tree/app)
- [Web Portal Branch](https://github.com/TechyMT/PBL-Sem-4/tree/web)




## Features

- User App Portal (Flutter):
  - Browse and choose from default documents
  - User Authentication: Users can create accounts or sign in to access the print request portal.
  - Upload and print PDFs from local storage
  - View print history with details such as date, number of pages, and amount
  - Integration with Firebase for backend operations (Firestore, Authentication, and Storage)

- Stationery Worker Web Portal (React, Next.js):
  - Print uploaded documents
  - View print history with details such as date, number of pages, and amount
  - Collect page to verify printed documents and distribute them to users
  - Integration with Firebase for backend operations (Firestore and Storage)

## Screenshots

### App Portal
<table>
  <tr>
    <td valign="top"> <img src = "https://github.com/TechyMT/PBL-Sem-4/blob/2626d0b5ec4900c5011f4dd54cd5fc48d55d684c/images/4.png" /></td>
    <td valign="top"><img src="https://github.com/TechyMT/PBL-Sem-4/blob/2626d0b5ec4900c5011f4dd54cd5fc48d55d684c/images/1.png" /></td>
  </tr>
  <tr>
    <td valign="top"><img src="https://github.com/TechyMT/PBL-Sem-4/blob/2626d0b5ec4900c5011f4dd54cd5fc48d55d684c/images/5.png" /></td>
    <td valign="top"><img src="https://github.com/TechyMT/PBL-Sem-4/blob/2626d0b5ec4900c5011f4dd54cd5fc48d55d684c/images/2.png" /></td>
  </tr>
   <tr>
    <td align="center"><img src="https://github.com/TechyMT/PBL-Sem-4/blob/2626d0b5ec4900c5011f4dd54cd5fc48d55d684c/images/3.png" /></td>
    
  </tr>
</table>

  
  
  
  
  

### Web Portal

<h2 align= "center">Home Page</h2>
  
![Web Portal](https://github.com/TechyMT/PBL-Sem-4/blob/cb2a48e433e93e81ba5ef5fa4c257c2018acfef3/images/Screenshot%202023-06-02%20123228.png)
  


<h2 align= "center">Meet The Team</h2>

![Web Portal](https://github.com/TechyMT/PBL-Sem-4/blob/cb2a48e433e93e81ba5ef5fa4c257c2018acfef3/images/Screenshot%202023-06-02%20123317.png)



<h2 align= "center">Print Docs</h2>

![Web Portal](https://github.com/TechyMT/PBL-Sem-4/blob/cb2a48e433e93e81ba5ef5fa4c257c2018acfef3/images/Screenshot%202023-06-02%20123330.png)



<h2 align= "center">Collect Documents</h2>

![Web Portal](https://github.com/TechyMT/PBL-Sem-4/blob/cb2a48e433e93e81ba5ef5fa4c257c2018acfef3/images/Screenshot%202023-06-02%20123343.png)



<h2 align= "center">History</h2>

![Web Portal](https://github.com/TechyMT/PBL-Sem-4/blob/cb2a48e433e93e81ba5ef5fa4c257c2018acfef3/images/Screenshot%202023-06-02%20123408.png)



## Technologies Used

- Flutter: A cross-platform framework for building mobile applications.
- Firebase: A comprehensive platform for developing mobile and web applications, providing authentication, database, and cloud storage functionalities.
  - Firestore: A NoSQL document database for storing and querying data.
  - Authentication: A service for user authentication and authorization.
  - Storage: A service for storing and retrieving files.
- React: A JavaScript library for building user interfaces.
- Next.js: A React framework for server-side rendering and static site generation.
- Firebase: A comprehensive platform for developing mobile and web applications, providing authentication, database, and cloud storage functionalities.
  - Firestore: A NoSQL document database for storing and querying data.
  - Storage: A service for storing and retrieving files.

## Getting Started

### App Portal

To get started with the App Portal, follow these steps:

1. Clone the repository: `git clone https://github.com/TechyMT/PBL-Sem-4.git`
2. Navigate to the app portal directory: `git checkout app-portal`
3. Install dependencies: `flutter pub get`
4. Launch the app: `flutter run`

Note: Make sure to configure Firebase credentials in the app portal for database and storage operations.

### Web Portal

To get started with the Web Portal, follow these steps:

1. Clone the repository: `git clone https://github.com/TechyMT/PBL-Sem-4.git`
2. Open the web portal directory: `git checkout web`
3. Install dependencies: `npm install`
4. Start the development server: `npm run dev`

Note: Make sure to configure Firebase credentials in the web portal for database and storage operations.



## License

PrintEZ is released under the [MIT License](LICENSE).
