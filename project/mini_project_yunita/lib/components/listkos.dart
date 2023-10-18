// class KosKosan {
//   final String nama;
//   final String harga;
//   final String lokasi;
//   final List<String> fasilitas;

//   KosKosan(this.nama, this.harga, this.lokasi, this.fasilitas);
// }

// class ListKosKosanPage extends StatelessWidget {
//   final List<KosKosan> daftarKosKosan;

//   ListKosKosanPage(this.daftarKosKosan);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kos-Kosan'),
//       ),
//       body: ListView.builder(
//         itemCount: daftarKosKosan.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text(daftarKosKosan[index].nama),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text('Harga: ${daftarKosKosan[index].harga}'),
//                   Text('Lokasi: ${daftarKosKosan[index].lokasi}'),
//                   Text('Fasilitas: ${daftarKosKosan[index].fasilitas.join(', ')}'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }