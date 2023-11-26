import 'dart:convert';
import 'dart:io';

import 'package:coder/moduls/direct_search/data/ICD10Data.dart';

List<ICD10Data> loadDataFromFile(String fileName) {
    final jsonFile = File(fileName);
    final jsonData = json.decode(jsonFile.readAsStringSync());

    return List<ICD10Data>.from(
      (jsonData['icd10cm-codes-2024'] as List).map(
        (item) => ICD10Data(item['Code'].toString().trim(), item['disease'].toString().trim()),
      ),
    );
  }
