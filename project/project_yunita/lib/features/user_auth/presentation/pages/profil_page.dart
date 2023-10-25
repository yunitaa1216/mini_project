// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_yunita/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:math';
import 'package:avatar_view/avatar_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final storage = FirebaseStorage.instanceFor(app: Firebase.app());
  FirebaseAuthService _authService = FirebaseAuthService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<String> randomAvatars = [
    'assets/avatars/1.png',
    'assets/avatars/2.png',
    'assets/avatars/3.png',
    'assets/avatars/4.png',
    // Tambahkan gambar-gambar avatar acak lainnya di sini
  ];

  String getRandomAvatar() {
    final random = Random();
    final index = random.nextInt(randomAvatars.length);
    return randomAvatars[index];
  }

  @override
Widget build(BuildContext context) {
  User? user = _authService.getCurrentUser();
  final randomAvatar = getRandomAvatar();

  return Scaffold(
    appBar: AppBar(
      title: Text('Profil'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Email: ${user?.email ?? 'Belum masuk'}'),
          // Text('UID: ${user?.uid ?? 'Belum masuk'}'),
          AvatarView(
  radius: 60, // Ukuran avatar
  borderWidth: 4, // Lebar border
  borderColor: Colors.white, // Warna border
  avatarType: AvatarType.CIRCLE, // Bentuk avatar (CIRCLE atau RECTANGLE)
  backgroundColor: Colors.grey, // Warna latar belakang
  imagePath: AssetImage('assets/avatars/1.png').assetName, // Gambar avatar default
),
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: firestore.collection('users').doc(user?.uid).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Terjadi kesalahan: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final userData = snapshot.data?.data();
                return Column(
                  children: [
                    Text('Username: ${userData?['username'] ?? 'Tidak ada data'}'),
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