import 'package:flutter/material.dart';
import 'package:kos_project/models/user_repository.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddData();
}

class _AddData extends State<AddData> {
  Repository repository = Repository();
  final _namecontroller = TextEditingController();
  final _nohpcontroller = TextEditingController();
  String? _selectedKosName;
  final kosNames = ['Kos Bahagia', 'Kos Sejahtera', 'Kos Ibu Dewi', 'Kos Makmur'];

  bool isValidPhoneNumber(String phoneNumber) {
  RegExp regex = RegExp(r'^0[0-9]{10,12}$');
  return regex.hasMatch(phoneNumber);
}

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>?;

    if (args != null) {
      if (args.length >= 4) {
        if (args[1].isNotEmpty) {
          _namecontroller.text = args[1];
        }
        if (args[2].isNotEmpty) {
          _nohpcontroller.text = args[2];
        }
        if (args[3].isNotEmpty && kosNames.contains(args[3])) {
          _selectedKosName = args[3];
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pemesanan'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: 'Nama',
              ),
            ),
            TextField(
              controller: _nohpcontroller,
              decoration: InputDecoration(
                hintText: 'No hp',
              ),
            ),
            DropdownButton<String>(
              hint: Text('Pilih Nama Kos'),
              value: _selectedKosName,
              items: kosNames.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedKosName = newValue;
                });
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      String name = _namecontroller.text;
                      String phoneNumber = _nohpcontroller.text;
                        if (name.isEmpty || phoneNumber.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Nama dan Nomor HP harus diisi.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          } else if (!isValidPhoneNumber(phoneNumber)) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Nomor HP tidak valid.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            bool response = await repository.postData(name, phoneNumber, _selectedKosName!);
                          if (response) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Sukses'),
                                  content: Text('Pemesanan berhasil! Pemilik kos akan menghubungi Anda.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Kembali ke halaman beranda atau tindakan lain yang sesuai.
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                              print('Gagal Menambah Data');
                            }
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (args != null && args.length > 0) {
                          bool response = await repository.putData(
                            int.parse(args[0]),
                            _namecontroller.text,
                            _nohpcontroller.text,
                            _selectedKosName!,
                          );
                          if (response) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Sukses'),
                                  content: Text('Data berhasil diubah.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            print('Gagal Mengubah Data');
                          }
                        }
                      },
                      child: Text('Update'),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}