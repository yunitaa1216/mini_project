import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes_project/user_auth/pages/sign_up_page.dart';
import 'package:tes_project/widget/form_container_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
          child: Image.asset('assets/images/5.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          ),
        ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome to our app!",
                    style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormContainerWidget(
                    controller: _emailController,
                    hintText: "Email",
                    isPasswordField: false,
                  ),
                  SizedBox(height: 10,),
                  FormContainerWidget(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: _signIn,
                    child: Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(159, 82, 54, 32),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child:Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                        },
                        child: Text("Sign Up",style: TextStyle(color: Color.fromARGB(159, 82, 54, 32),fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user!= null){
      print("User is successfully signedIn");
      Navigator.pushNamed(context, "/home");
    } else{
      print("Some error happend");
    }

  }
}