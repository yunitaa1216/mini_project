// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
// import 'package:kos_project/features/user_auth/presentation/pages/login_page.dart';
// import 'package:kos_project/features/user_auth/presentation/pages/sign_up_page.dart';
// import 'package:kos_project/features/user_auth/presentation/pages/home_page.dart';
// import 'package:kos_project/features/app/splash_screen/splash_screen.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyC1wyqMMwiEdC90lmTFzNfHb9FMsn8jqck",
//         appId: "1:70276721199:web:91beeec6e112989228f4da",
//         messagingSenderId: "70276721199",
//         projectId: "kosappproject",
//         // Your web Firebase config options
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:indocars/MyProfil.dart';
import 'package:kos_project/MyProfil.dart';
import 'MyProfil.dart';
import 'Tampilan_mobil.dart';

void main() {
  runApp(
    new MaterialApp(
    home: new Home(),
    routes: <String, WidgetBuilder>{
      '/page1' : (BuildContext context) => new Home(),
      '/page2' : (BuildContext context) => new MyProfil(),
      '/page3' : (BuildContext context) => new Tampilanmobil(),
    },
  ),
  );
}

class Home extends StatelessWidget {
  String teks='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('GoTrav'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: (){
                Navigator.pushNamed(context, '/page2');
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.asset('images/gotrav.jpg',
              fit: BoxFit.fitWidth,
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(50.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                      hintText: 'Masukan Lokasi Anda Sekarang',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: RaisedButton(
              onPressed: (){
                var route = new MaterialPageRoute(builder: (context)=> Tampilanmobil(),
                );
                    Navigator.of(context).push(route);
              },
              padding: EdgeInsets.all(10.0),
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text(
                'Search',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
