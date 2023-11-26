part of 'direct_search_cubit.dart';

@immutable
sealed class DirectSearchState {}

class DirectSearchInitial extends DirectSearchState {}

class DirectSearchLoading extends DirectSearchState {}

class SrarchByCode extends DirectSearchState {
  final List<ICD10Data> result;

  SrarchByCode(this.result);
}

class SrarchByDisease extends DirectSearchState {
  final List<ICD10Data> result;

  SrarchByDisease(this.result);
}



