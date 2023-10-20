import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Tambahkan properti currentUser
  User? get currentUser => _auth.currentUser;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Perbarui currentUser setelah pendaftaran berhasil
      // return _auth.currentUser;
    } catch (e) {
      print("Some error occurred");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Perbarui currentUser setelah masuk berhasil
      // return _auth.currentUser;
    } catch (e) {
      print("Some error occurred");
    }
    return null;
  }

  // Tambahkan metode untuk mengganti email
  Future<void> changeEmail(String newEmail) async {
    try {
      currentUser?.updateEmail(newEmail);
      await _auth.currentUser?.updateEmail(newEmail);
    } catch (e) {
      print("Error changing email: $e");
    }
  }

  // Tambahkan metode untuk mengganti password
  Future<void> changePassword(String newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print("Error changing password: $e");
    }
  }

  // Tambahkan metode untuk menghapus akun
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } catch (e) {
      print("Error deleting account: $e");
    }
  }
}