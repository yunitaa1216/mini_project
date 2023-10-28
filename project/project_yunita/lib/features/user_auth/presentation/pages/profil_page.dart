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

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController currentUsernameController = TextEditingController();

  @override
Widget build(BuildContext context) {
  User? user = _authService.getCurrentUser();
  final randomAvatar = getRandomAvatar();

  return Scaffold(
    appBar: AppBar(
      title: Text('Profil'),
    ),
    body: 
    Center(
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
            Form(
  key: _formKey,
  child: Column(
    children: [
      ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        String newEmail = user?.email ?? '';
        String newUsername = '';
        String currentUsername = '';

        return AlertDialog(
          title: Text('Update Email and Username'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Current Email'),
                controller: TextEditingController(text: user?.email ?? ''),
                enabled: false,
              ),
              TextField(
  decoration: InputDecoration(labelText: 'Current Username'),
  controller: currentUsernameController,
  enabled: false,
  // Isi dengan username lama
  // currentUsernameController.text = currentUsername;
),
              TextField(
                decoration: InputDecoration(labelText: 'New Email'),
                onChanged: (value) {
                  newEmail = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'New Username'),
                onChanged: (value) {
                  newUsername = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
  Navigator.of(context).pop();
  if (user != null) {
    updateEmail(user, newEmail);
    updateUserData(user.uid, newEmail, newUsername);
  }
},
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  },
  child: Text('Update Email and Username'),
),
ElevatedButton(
  onPressed: () {
    if (user != null) {
      createUserData(user.uid, emailController.text, usernameController.text);
    }
  },
  child: Text('Create New User Data'),
),
ElevatedButton(
  onPressed: () {
    if (user != null) {
      // Hapus data pengguna dari Firestore
      deleteUserData(user.uid);
    }
  },
  child: Text('Delete User Data'),
),

    ],
  ),
),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: firestore.collection('users').doc(user?.uid).get(),
              builder: (context, snapshot) {
                String currentUsername = '';
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Terjadi kesalahan: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final userData = snapshot.data?.data();
                  currentUsername = userData?['username'] ?? '';
                  return Column(
                    children: [
                      Text('Username: ${currentUsername}'),
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

  // Function to update user data in Firestore
  void updateUserData(String? userId, String newEmail, String newUsername) async {
  // Update data di Firestore
  await firestore.collection('users').doc(userId).update({
    'email': newEmail,
    'username': newUsername,
  });

  // Update data di Firebase Authentication
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.updateEmail(newEmail);
  }
}

void updateEmail(User user, String newEmail) async {
  try {
    await user.updateEmail(newEmail);
  } catch (e) {
    // Handle errors, misalnya, email sudah digunakan atau kesalahan lainnya
    print("Gagal memperbarui alamat email: $e");
  }
}

  void createUserData(String userId, String email, String username) {
  firestore.collection('users').doc(userId).set({
    'email': email,
    'username': username,
  }).then((_) {
    // Data pengguna baru berhasil dibuat
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data pengguna baru berhasil dibuat')),
    );
  }).catchError((error) {
    // Gagal membuat data pengguna baru, tampilkan pesan kesalahan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal membuat data pengguna baru: $error')),
    );
  });
}

void deleteUserData(String userId) async {
  // Delete data di Firestore
  await firestore.collection('users').doc(userId).delete();

  // Delete data di Firebase Authentication
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.delete();
  }
}
}