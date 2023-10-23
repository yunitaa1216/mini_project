// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   User? _user;
// //   Map<String, dynamic>? _userData;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchUserData();
// //   }

// //   Future<void> _fetchUserData() async {
// //     _user = _auth.currentUser;
// //     if (_user != null) {
// //       final userDataSnapshot =
// //           await _firestore.collection('users').doc(_user!.uid).get();

// //       if (userDataSnapshot.exists) {
// //         setState(() {
// //           _userData = userDataSnapshot.data() as Map<String, dynamic>;
// //         });
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Profile"),
// //       ),
// //       body: _userData != null
// //           ? Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text("Username: ${_userData!['username']}"),
// //                 Text("Email: ${_userData!['email']}"),
// //                 // Tambahkan lebih banyak bidang data pengguna jika diperlukan
// //               ],
// //             )
// //           : CircularProgressIndicator(), // Tampilkan indikator loading saat mengambil data
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_yunita/firebase_auth_service.dart';
import 'package:project_yunita/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    User? user = _authService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${user?.email ?? 'Belum masuk'}'),
            Text('UID: ${user?.uid ?? 'Belum masuk'}'),
            FutureBuilder<Map<String, dynamic>?>(
              future: _authService.getUserData(user?.uid ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Terjadi kesalahan: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final userData = snapshot.data;
                  return Column(
                    children: [
                      Text('Nama: ${userData?['nama'] ?? 'Tidak ada data'}'),
                      // Tambahkan informasi profil lainnya di sini
                    ],
                  );
                } else {
                  return Text('Tidak ada data pengguna.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? _user;
//   Map<String, dynamic>? _userData;
//   TextEditingController _usernameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     _user = _auth.currentUser;
//     if (_user != null) {
//       final userDataSnapshot =
//           await _firestore.collection('users').doc(_user!.uid).get();

//       if (userDataSnapshot.exists) {
//         setState(() {
//           _userData = userDataSnapshot.data() as Map<String, dynamic>;
//           _usernameController.text = _userData!['username'];
//         });
//       }
//     }
//   }

//   Future<void> _updateUserData() async {
//     if (_user != null) {
//       await _firestore.collection('users').doc(_user!.uid).update({
//         'username': _usernameController.text,
//         // Tambahkan lebih banyak bidang data pengguna yang ingin diubah di sini
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//       ),
//       body: _userData != null
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(labelText: 'Username'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _updateUserData();
//                   },
//                   child: Text('Update Profile'),
//                 ),
//                 Text("Username: ${_userData!['username']}"),
//                 Text("Email: ${_userData!['email']}"),
//                 // Tambahkan lebih banyak bidang data pengguna jika diperlukan
//               ],
//             )
//           : CircularProgressIndicator(), // Tampilkan indikator loading saat mengambil data
//     );
//   }
// }
