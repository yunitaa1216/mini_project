import 'package:flutter/material.dart';
import 'package:tes_project/UI/product/addProduct/addProduct_screen.dart';
import 'package:tes_project/constants.dart';

import 'components/body.dart';
class ProductScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => AddProduct(),
              )
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kPrimaryColor,
          ),
          child: Icon(Icons.add, color: Colors.white),
        )
      ),
      body: Body(),
    );
  }
}