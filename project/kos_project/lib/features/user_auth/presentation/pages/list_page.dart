import 'package:flutter/material.dart';
// yunitaanggeraini@gmail.com
// Buat class yang merepresentasikan informasi tentang kos
class Kos {
  final String nama;
  final String deskripsi;
  final double harga;
  final String gambarAsset;

  Kos({required this.nama, required this.deskripsi, required this.harga, required this.gambarAsset});
}

class ListPage extends StatelessWidget {
  ListPage({super.key});

  // Buat daftar kos
  final List<Kos> daftarKos = [
  Kos(
    nama: "Kos A",
    deskripsi: "Kos mewah dekat pusat kota",
    harga: 1000.0,
    gambarAsset: "assets/images/kos_1.jpg",
  ),
  Kos(
    nama: "Kos B",
    deskripsi: "Kos nyaman dekat kampus",
    harga: 800.0,
    gambarAsset: "assets/images/kos_2.jpg",
  ),
  // Tambahkan lebih banyak kos sesuai kebutuhan
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Kos"),
      ),
      body: ListView.builder(
        itemCount: daftarKos.length,
        itemBuilder: (context, index) {
          final kos = daftarKos[index];
          return ListTile(
            leading: Image.network(kos.gambarAsset), // Tampilkan gambar kos
            title: Text(kos.nama), // Tampilkan nama kos
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(kos.deskripsi), // Tampilkan deskripsi kos
                Text("Harga: \$${kos.harga.toStringAsFixed(2)}"), // Tampilkan harga kos
              ],
            ),
          );
        },
      ),
    );
  }
}
