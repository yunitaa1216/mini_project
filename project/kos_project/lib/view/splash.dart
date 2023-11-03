import 'package:flutter/material.dart';
import 'package:kos_project/view/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       height: double.infinity,
       width: double.infinity,
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Color.fromARGB(221, 66, 45, 18),
             Color.fromARGB(239, 180, 161, 161),
           ]
         )
       ),
       child: Column(
         children: [
           const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Image(
              image: AssetImage('assets/splash.png'),
              width: 200,
              height: 200,
            ),
          ),
           const SizedBox(
             height: 70,
           ),
           const Text('Welcome',style: TextStyle(
             fontSize: 30,
             color: Colors.white
           ),),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(child: Text('Login',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),),
            ),
          ),
          ]
       ),
     ),
    );
  }
}