// ignore_for_file: implementation_imports, duplicate_ignore, depend_on_referenced_packages

import 'package:coder/moduls/home/pages/home_layout_screen.dart';
import 'package:coder/moduls/auth/presentation/pages/login_screen.dart';
import 'package:coder/routes/routes_names.dart';
import 'package:flutter_modular/flutter_modular.dart'; // ignore: depend_on_referenced_packages, implementation_imports

import 'package:modular_interfaces/src/route/modular_arguments.dart';

List<ModularRoute> modularRoutes = <ChildRoute<dynamic>>[
   
   ChildRoute<dynamic>(
    AppRoutes.start,
    child: (_, ModularArguments args) =>  LogInScreen(),
    transition: TransitionType.fadeIn,
  ),
   ChildRoute<dynamic>(
    AppRoutes.homeScreen,
    child: (_, ModularArguments args) =>  HomeLayoutScreen(),
    transition: TransitionType.fadeIn,
  ),


];
