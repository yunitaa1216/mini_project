import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      final userDataSnapshot =
          await _firestore.collection('users').doc(_user!.uid).get();

      if (userDataSnapshot.exists) {
        setState(() {
          _userData = userDataSnapshot.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: _userData != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Username: ${_userData!['username']}"),
                Text("Email: ${_userData!['email']}"),
                // Tambahkan lebih banyak bidang data pengguna jika diperlukan
              ],
            )
          : CircularProgressIndicator(), // Tampilkan indikator loading saat mengambil data
    );
  }
}