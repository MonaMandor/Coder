import 'dart:math';

import 'package:coder/moduls/direct_search/data/ICD10Data.dart';
import 'package:coder/moduls/direct_search/domain/binary_direct_search.dart';
import 'package:coder/moduls/direct_search/domain/load_data.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'direct_search_state.dart';

class DirectSearchCubit extends Cubit<DirectSearchState> {
  DirectSearchCubit() : super(DirectSearchInitial());
  Future <void> SearchByCode(String query) async {
    emit(DirectSearchLoading());
    final data = loadDataFromFile('assets/data/icd10cm-codes-sorted-by-code.json');
    final result = binarySearchByCode(data, query);
    emit(SrarchByCode(result));}
  Future <void> SearchByDisease(String query) async {
    emit(DirectSearchLoading());
    final data = loadDataFromFile('assets/data/icd10cm-codes-sorted-by-disease.json');
    final result = binarySearchByDisease(data, query);
    emit(SrarchByDisease(result));}
     void clearSearch() {
    emit(DirectSearchInitial());
  }



  
  }


