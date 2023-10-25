import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:project_yunita/features/user_auth/presentation/pages/login_page.dart';
import 'package:project_yunita/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:project_yunita/features/user_auth/presentation/pages/home_page.dart';
import 'package:project_yunita/features/app/splash_screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD-a-K-NTKysSLw33s7hiDCch3ddMmLZ_4",
        appId: "1:383736699664:android:c4b1714fc7fbe2b2036395",
        messagingSenderId: "383736699664",
        projectId: "firestore-070",
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
      // Ganti rute default menjadi LoginPage
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Firebase',
//       routes: {
//         '/': (context) => SplashScreen(
//           // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
//           child: LoginPage(),
//         ),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }