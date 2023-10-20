import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:kos_project/features/user_auth/presentation/pages/login_page.dart';
import 'package:kos_project/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:kos_project/features/user_auth/presentation/pages/home_page.dart';
import 'package:kos_project/features/app/splash_screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDJpPc-AruXEXQnCqn6Jk3A0ZTEtUnCpPI",
        appId: "1:981744983881:web:d3d637aff53db7706dc498",
        messagingSenderId: "981744983881",
        projectId: "kosapp-f5cec",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}