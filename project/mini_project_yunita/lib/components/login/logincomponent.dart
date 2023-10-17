import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:mini_project_yunita/components/login/loginform.dart';
import 'package:mini_project_yunita/size_config.dart';
import 'package:mini_project_yunita/utils/constants.dart';

class loginComponent extends StatefulWidget{
  @override
  _loginComponent createState() => _loginComponent();
}

class _loginComponent extends State<loginComponent>{

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04,
                ),
                SimpleShadow(
                  child: Image.asset("assets/images/logo.png", height: 150, width: 202,
                  ),
                  // opacity: 0.5,
                  color: mTitleColor,
                  offset: Offset(5, 5),
                  sigma: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style:  mTitleStyle,
                        ),
                      ],
                    ),),
                    SizedBox(height: 20,
                    ),
                    Signinform()
              ],
            ),
          ),
          ),
      ));
  }
}