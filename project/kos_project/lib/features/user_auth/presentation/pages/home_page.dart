import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_yunita/features/user_auth/presentation/pages/list_page.dart';
import 'package:project_yunita/features/user_auth/presentation/pages/profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  String _searchText = '';
  
  void _searchKos(String text) {
    // Cari kos berdasarkan teks yang dimasukkan oleh pengguna
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/KosApp.png',
            width: 250, // Atur lebar gambar sesuai kebutuhan
            height: 200,  // Atur tinggi gambar sesuai kebutuhan
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            //
            ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Center(child: Text("Welcome Home buddy!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)),
                  // SizedBox(height: 30,),

                  // Tambahkan widget TextField untuk pencarian
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari kos berdasarkan lokasi, harga, fasilitas, dan lainnya',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Lakukan pencarian
                        },
                      ),
                    ),
                    onChanged: (text) {
                      _searchText = text;
                      _searchKos(text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          // Berpindah ke halaman list atau profil sesuai dengan index button

          setState(() {
            _selectedIndex = index;
          });

          if (_selectedIndex == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
          } else if (_selectedIndex == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
      ),
    );
  }
}