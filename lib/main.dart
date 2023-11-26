
import 'dart:convert';

import 'package:coder/core/theme/app_Theme.dart';
import 'package:coder/moduls/deep_search/domain/load_data.dart';
import 'package:coder/moduls/deep_search/presentation/cubit/cubit/disease_cubit_cubit.dart';

import 'package:coder/moduls/direct_search/presentation/pages/cubit/cubit/direct_search_cubit.dart';
import 'package:coder/moduls/diseases_tree/presentation/cubit/show_tree_cubit.dart';
import 'package:coder/routes/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'moduls/deep_search/data/Disease.dart';

void main() async {

  runApp(ModularApp(
    module: AppModule(),
    child: DevicePreview(
      enabled: false,
     builder: (BuildContext context) =>  MyApp([]),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<Disease> allDiseases;

  const MyApp(this.allDiseases);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DirectSearchCubit()),
        // Add your DiseaseSearchCubit here with allDiseases data
        BlocProvider(
          create: (context) => DiseaseCubitCubit(),
        ),

        BlocProvider(
          create: (context) => ShowTreeCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Bdaity Pay',
 
        theme: AppTheme().theme,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}