import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:kos_project/view_model/daftarkosdetailprovider.dart';

class DaftarKosDetail extends StatelessWidget {
  final String imagePath;
  final String nameKos;
  final String harga;
  final String fasilitas;
  final String phoneNumber;
  final String deskripsi;

  DaftarKosDetail({
    required this.imagePath,
    required this.nameKos,
    required this.harga,
    required this.fasilitas,
    required this.phoneNumber,
    required this.deskripsi,
  });
  
  @override
  Widget build(BuildContext context) {
    final daftarKosDetailProvider = Provider.of<DaftarKosDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(nameKos),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath),
            Text(nameKos),
            Text("Harga: $harga"),
            Text("Fasilitas: $fasilitas"),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(deskripsi),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                launch('whatsapp://send?phone=${daftarKosDetailProvider.phoneNumber}');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown, // Mengubah warna latar belakang tombol menjadi coklat
              ),
              child: Text("Hubungi Pemilik Kos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), // Mengubah warna teks menjadi hitam
            ),
            SizedBox(height: 16.0),
          ],
        )
      ),
    );
  }
}