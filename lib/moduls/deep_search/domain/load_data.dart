import 'dart:convert';
import 'dart:core';


import 'package:coder/moduls/deep_search/data/Disease.dart';
import 'package:flutter/services.dart';

  Future <List<Disease>> convertToDisease ()async{

    var allData = json.decode(await loadFile('assets/data/tabular.json'));
  var allData2 = allData['ICD10CM.tabular'];
  var list = allData2.map((e) => e['section']).toList();
  
  List<Disease> rootDisease = [];
  
  for (var element in list) {
    var listDisease = <Disease>[];
    for (var element2 in element) {
      
      listDisease.add(Disease.convertToDisease(element2));
    }
    rootDisease.addAll(listDisease);
  }
  print(rootDisease.length);
  return rootDisease;
}
Future<String> loadFile(String path) async {
   return await rootBundle.loadString(path);
 
}


