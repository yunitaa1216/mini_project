import 'package:flutter/material.dart';
// import 'package:tes_project/components/login/logincomponent.dart';
import 'package:mini_project_yunita/size_config.dart';

class registerScreen extends StatelessWidget{
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      // body: loginComponent(),
    );
  }
}