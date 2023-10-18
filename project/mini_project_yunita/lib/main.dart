import 'package:flutter/material.dart';
import 'package:mini_project_yunita/pages/daftar_kos.dart';
import 'package:mini_project_yunita/pages/halaman.dart';
import 'package:mini_project_yunita/pages/listkos.dart';
// import 'package:mini_project_yunita/routes.dart';
import 'package:mini_project_yunita/screens/login/loginScreens.dart';
import 'package:mini_project_yunita/theme.dart';
import 'package:mini_project_yunita/components/custom_bottom_navigationbar.dart';

void main() async {
  runApp(MaterialApp(
    title: "KosApp Mobile",
    theme: theme(),
    initialRoute: loginScreen.routeName,
    routes: {
      loginScreen.routeName: (context) => loginScreen(),
      
      somePage.routeName:(context) => somePage(),
      // listKos.routeName:(context) => listKos()
    },
  ));
}

class SomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Page'),
      ),
      body: Center(
        child: Text('This is Some Page Content'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0, // Sesuaikan indeks yang sesuai dengan halaman ini
        onTap: (index) {
          // Tambahkan logika untuk berpindah antar halaman berdasarkan indeks
        },
      ),
    );
  }
}