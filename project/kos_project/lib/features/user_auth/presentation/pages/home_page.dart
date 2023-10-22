// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kos_project/features/user_auth/presentation/pages/list_page.dart';
// import 'package:kos_project/features/user_auth/presentation/pages/profil_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HomePage"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text("Welcome Home buddy!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)),
//           SizedBox(height: 30,),
//           GestureDetector(
//             onTap: (){
//               FirebaseAuth.instance.signOut();
//               Navigator.pushNamed(context, "/login");

//             },
//           child: Container(
//             height: 45,
//             width: 100,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(10)
//             ),
//             child: Center(child: Text("Sign out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
//           ),)
//           // Tambahkan kode bottom navigation di sini
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'List',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profil',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           // Berpindah ke halaman list atau profil sesuai dengan index button

//           setState(() {
//             _selectedIndex = index;
//           });

//           if (_selectedIndex == 0) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
//           } else if (_selectedIndex == 1) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
//           }
//         },
//       ),
//     );
//   }
// }