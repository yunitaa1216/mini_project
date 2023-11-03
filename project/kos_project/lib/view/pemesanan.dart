import 'package:flutter/material.dart';
import 'package:kos_project/models/user_model.dart';
import 'package:kos_project/models/user_repository.dart';

class PemesananPage extends StatefulWidget {
  const PemesananPage({Key? key}) : super(key: key);

  @override
  State<PemesananPage> createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  Repository repository = Repository();

  Future<List<User>?> fetchData() async {
    try {
      return await repository.getData();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Pemesanan"),
        backgroundColor: Colors.brown,
        actions: [
          ElevatedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/add');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text('Pesan Kos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
        )
        ],
      ),
      body: FutureBuilder<List<User>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null && snapshot.data is List<User>) {
          List<User> listUser = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).popAndPushNamed(
                        '/add', 
                        arguments: [
                          listUser[index].id, 
                          listUser[index].name, 
                          listUser[index].no_hp,
                          listUser[index].nama_kos
                          ]),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listUser[index].name,
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                  listUser[index].no_hp,
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  listUser[index].nama_kos,
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                    ),
                    IconButton(
                      onPressed: () async {
                        bool shouldDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Konfirmasi Penghapusan"),
                              content: Text("Anda yakin ingin menghapus data ini?"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Batal"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                TextButton(
                                  child: Text("Ya, Hapus"),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        if (shouldDelete == true) {
                          bool response = await repository.deleteData(listUser[index].id);
                          if (response) {
                            print('Berhasil menghapus data');
                          } else {
                            print('Gagal menghapus data');
                          }
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listUser.length,
            );
            } else {
            return Center(child: Text('No data available.')); 
          }
        },
      ),
    );
  }
}