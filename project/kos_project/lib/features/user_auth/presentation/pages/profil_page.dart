import 'package:flutter/material.dart';
import 'package:kos_project/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  String _email = '';
  String _nama = '';
  TextEditingController _newEmailController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _newEmailController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _email = _authService.currentUser?.email ?? '';
    _nama = _authService.currentUser?.displayName ?? '';
  }

  void _changeEmail() async {
    String newEmail = _newEmailController.text;
    await _authService.changeEmail(newEmail);
    setState(() {
      _email = newEmail;
    });
    _newEmailController.clear();
  }

  void _changePassword() async {
    String newPassword = _newPasswordController.text;
    await _authService.changePassword(newPassword);
    _newPasswordController.clear();
  }

  void _deleteAccount() async {
    await _authService.deleteAccount();
    // Tambahkan logika untuk kembali ke halaman login atau tampilan lain yang sesuai.
  }

  void _createAccount() async {
    // Tambahkan logika untuk membuat akun baru berdasarkan data yang sesuai.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(_nama),
            subtitle: Text(_email),
          ),
          ListTile(
            title: Text('Change Email'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Change Email'),
                  content: TextField(
                    controller: _newEmailController,
                    decoration: InputDecoration(labelText: 'New Email'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _changeEmail();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Change Password'),
                  content: TextField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(labelText: 'New Password'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _changePassword();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text('Delete Account'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Account'),
                  content: Text('Are you sure you want to delete your account?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _deleteAccount();
                        Navigator.of(context).pop();
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text('Create New Account'),
            onTap: () {
              // Implementasi untuk membuat akun baru berdasarkan data yang sesuai.
              _createAccount();
            },
          ),
        ],
      ),
    );
  }
}