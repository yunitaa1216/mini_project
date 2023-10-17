import 'package:flutter/material.dart';
import 'package:mini_project_yunita/components/login/logincomponent.dart';
import 'package:mini_project_yunita/size_config.dart';

class loginScreen extends StatelessWidget{
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: loginComponent(),
    );
  }
}