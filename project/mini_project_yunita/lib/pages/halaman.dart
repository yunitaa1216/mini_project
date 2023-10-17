// import 'package:flutter/material.dart';
// // import 'package:mini_project_yunita/components/custom_bottom_navigation_bar.dart';
// import 'package:mini_project_yunita/components/custom_bottom_navigationbar.dart';

// class SomePage extends StatelessWidget {
//   static const String routeName = "/somePage";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Some Page'),
//       ),
//       body: Center(
//         child: Text('This is Some Page Content'),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: 0, // Sesuaikan indeks yang sesuai dengan halaman ini
//         onTap: (index) {
//           // Tambahkan logika untuk berpindah antar halaman berdasarkan indeks
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mini_project_yunita/components/login/logincomponent.dart';
import 'package:mini_project_yunita/components/halaman_baru.dart';
import 'package:mini_project_yunita/size_config.dart';

class somePage extends StatelessWidget{
  static String routeName = "/somepage";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: halaman(),
    );
  }
}