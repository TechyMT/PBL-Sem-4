# PrintEZ - Print Request Portal

PrintEZ is a web and app-based portal designed for users to easily send print requests for their documents. The portal includes a default document feature, providing users with a collection of necessary documents available at the college stationary. Users can upload their own documents or select from the available default documents. After payment, the print requests are managed through a web portal accessible by the stationary personnel.

## Technologies Used

- Next.js
- React
- Firestore Authentication
- Firebase Storage
- Flutter (for the app)
- Firebase features (for the app)

## Features

1. User Authentication: Users can create accounts or sign in to access the print request portal.
2. Print Requests: Users can submit print requests by uploading their documents or selecting from the default documents available.
3. Payment Integration: Users can make payments for their print requests.
4. Web Portal: The stationary personnel can view and manage print requests through a dedicated web portal.
5. Verification and Collection: Users can verify and collect their printed documents using the accept page.
6. Print History: The stationary owner can view the history of prints done in a day, including the amount earned and pages printed.
7. Unique Print ID: The stationary personnel can verify the printed documents by entering a unique 5-digit ID.

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/PrintEZ.git
   ```

2. Navigate to the project directory:

   ```shell
   cd PrintEZ
   ```

3. Install the dependencies for the web portal:

   ```shell
   cd web-portal
   npm install
   ```

4. Install the dependencies for the app:

   ```shell
   cd app
   flutter pub get
   ```

5. Set up Firebase:

   - Create a Firebase project and enable Firestore Authentication and Firebase Storage.
   - Obtain the Firebase configuration details (API key, project ID, etc.) for both the web and app projects.
   - Update the configuration files in the web portal (`web-portal/firebase.js`) and the app (`app/lib/firebase.dart`) with your Firebase credentials.

6. Start the web portal development server:

   ```shell
   npm run dev
   ```

7. Build and run the app on an emulator or physical device:

   ```shell
   flutter run
   ```

## Contributing

Contributions to the PrintEZ project are welcome! If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request.

Please ensure that your contributions align with the project's coding style and guidelines.

## License

The PrintEZ project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.
