import 'package:flutter/material.dart';
import 'package:mini_project_yunita/components/custom_surfix_icon.dart';
import 'package:mini_project_yunita/components/default_button_custom_color.dart';
import 'package:mini_project_yunita/screens/register/registrasi.dart';
import 'package:mini_project_yunita/size_config.dart';
import 'package:mini_project_yunita/utils/constants.dart';

class Signinform extends StatefulWidget{
  @override
  _Signinform createState() => _Signinform();
}

class _Signinform extends State<Signinform>{

  FocusNode focusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;
  
  TextEditingController textUsername = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Form(
      child: Column(
        children: [
          buildUsername(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30),),
          Row(
            children: [
              Checkbox(
                value: remember, 
                onChanged: (value){setState(() {
                  remember = value;
                });
                }),
                Text("Tetap Masuk"),
                Spacer(),
                GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Lupa Password", 
                    style: TextStyle(decoration: TextDecoration.underline),
                    ),
                )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Masuk",
            press: (){},
          ),
          SizedBox(height: 20,),
          GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, registerScreen.routeName);
                  },
                  child: Text(
                    "Belum punya akun? Daftar disini", 
                    style: TextStyle(decoration: TextDecoration.underline),
                    ),
                )
        ],
      ));
  }

  TextFormField buildUsername(){
    return TextFormField(
      controller: textUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'username',
        hintText: 'masukkan username anda',
        labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
          )
      ),
    );
  }

  TextFormField buildPassword(){
    return TextFormField(
      controller: textPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'password',
        hintText: 'masukkan password anda',
        labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
          )
      ),
    );
  }

}