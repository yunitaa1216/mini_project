import 'package:flutter/material.dart';
import 'package:mini_project_yunita/main.dart';
import 'package:mini_project_yunita/pages/daftar_kos.dart';
import 'package:mini_project_yunita/pages/halaman.dart';
import 'package:mini_project_yunita/pages/listkos.dart';
import 'package:mini_project_yunita/screens/login/loginScreens.dart';
import 'package:mini_project_yunita/screens/register/registrasi.dart';

final Map<String, WidgetBuilder> routes = {
  loginScreen.routeName: (context) => loginScreen(),
  registerScreen.routeName: (context) => registerScreen(),
  somePage.routeName:(context) => somePage(),
  // listKos.routeName:(context) => listKos()
};