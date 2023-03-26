// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:printez/homepage.dart';
// import 'package:printez/landingpage.dart';
// import 'package:printez/loginview.dart';
// import 'package:printez/new.dart';

// class AuthController extends GetxController {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   final Rxn<User?> _firebaseUser = Rxn<User?>();

//   void onAuthStateChanged(User user) {
//     _firebaseUser.value = user;
//   }

//   @override
//   void onInit() {
//     _firebaseUser.bindStream(auth.authStateChanges());
//     ever(_firebaseUser, handleAuthChanged);
//     super.onInit();
//   }

//   void handleAuthChanged(User? user) {
//     if (user == null) {
//       Get.offAll(() => LandingPage());
//     } else {
//       Get.off(() => MyWidget());
//     }
//   }
// }
