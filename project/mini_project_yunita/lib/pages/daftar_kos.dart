// import 'package:mini_project_yunita/components/listkos.dart';
// import 'package:mini_project_yunita/components/custom_bottom_navigationbar.dart';
// import 'package:flutter/material.dart';

// // List<Kos> daftarKos = [
// //   Kos("Kosan A", 500000.0, "https://example.com/kos1.jpg", "Alamat A", ["AC", "WiFi"]),
// //   Kos("Kosan B", 600000.0, "https://example.com/kos2.jpg", "Alamat B", ["WiFi"]),
// //   // Tambahkan data kos lainnya
// // ];

// class DaftarKosPage extends StatelessWidget {
//   final List<Kos> daftarKos;
//   static String routeName = "/daftarkos";

//   DaftarKosPage(this.daftarKos);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kos'),
//       ),
//       body: ListView.builder(
//         itemCount: daftarKos.length,
//         itemBuilder: (context, index) {
//           Kos kos = daftarKos[index];
//           return ListTile(
//             title: Text(kos.nama),
//             subtitle: Text('Harga: Rp ${kos.harga.toStringAsFixed(2)}'),
//             leading: Image.network(kos.gambarUrl),
//             onTap: () {
//               // Tambahkan logika untuk menavigasi ke halaman detail kos
//             },
//           );
//         },
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
