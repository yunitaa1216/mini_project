import 'package:tes_project/widget/category.dart';
import 'package:tes_project/widget/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        // BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Tersimpan"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 140, width: double.infinity, color: Colors.brown),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg")),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Selamat Datang !",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "Cari Kos Terbaikmu",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Row(
            //     children: [
            //       Category(imagePath: "assets/tubruk.png", title: "Tubruk"),
            //       Category(imagePath: "assets/mesin.png", title: "Espresso"),
            //       Category(imagePath: "assets/cup.png", title: "Latte"),
            //       Category(imagePath: "assets/biji.png", title: "Biji"),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Daftar Kos 🏡",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CoffeShop(
              imagePath: "assets/kos_1.jpg",
              nameShop: "Kos Bahagia",
              harga: "500k/bulan",
              fasilitas: "Kamar mandi dalam, AC, Wifi, CCTV, Parkir",
            ),
            CoffeShop(
              imagePath: "assets/kos_2.jpg",
              nameShop: "Kos Sejahtera",
              harga: "4.9",
              fasilitas: "13.00 - 23.00",
            ),
            CoffeShop(
              imagePath: "assets/kos_3.jpg",
              nameShop: "Kos Ibu Dewi",
              harga: "4.7",
              fasilitas: "13.00 - 20.00",
            ),
            CoffeShop(
              imagePath: "assets/kos_4.jpg",
              nameShop: "Kos Makmur",
              harga: "4.7",
              fasilitas: "13.00 - 20.00",
            ),
          ],
        )),
      ),
    );
  }
}
