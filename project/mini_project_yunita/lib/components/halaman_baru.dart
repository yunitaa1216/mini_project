import 'package:flutter/material.dart';
import 'package:mini_project_yunita/components/custom_bottom_navigationbar.dart';
// import 'package:simple_shadow/simple_shadow.dart';
// import 'package:mini_project_yunita/components/login/loginform.dart';
// import 'package:mini_project_yunita/size_config.dart';
// import 'package:mini_project_yunita/utils/constants.dart';

class halaman extends StatefulWidget{
  @override
  _halaman createState() => _halaman();
}

class _halaman extends State<halaman>{
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