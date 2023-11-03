import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:kos_project/view_model/daftarkosdetailprovider.dart';

class DaftarKos extends StatelessWidget {
  final String imagePath;
  final String nameKos;
  final String harga;
  final String fasilitas;
  final VoidCallback onPressed;

  const DaftarKos(
      {Key? key,
      required this.imagePath,
      required this.nameKos,
      required this.harga,
      required this.fasilitas,
      required this.onPressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 240,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(imagePath, fit: BoxFit.cover))
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                child: SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nameKos,
                            style: GoogleFonts.montserrat(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.amber),
                            SizedBox(
                              width: 5,
                            ),
                            Text(harga,
                                style: GoogleFonts.montserrat(fontSize: 12)),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.list, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text(fasilitas,
                                style: GoogleFonts.montserrat(fontSize: 12)),
                              SizedBox(
                                width: 20,
                              ),
                            TextButton(
                              onPressed: onPressed,
                              child: Text("Detail"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}