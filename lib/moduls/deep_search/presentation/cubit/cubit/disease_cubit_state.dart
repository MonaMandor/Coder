part of 'disease_cubit_cubit.dart';

sealed class DiseaseCubitState extends Equatable {
  const DiseaseCubitState();

  @override
  List<Object> get props => [];
}

final class DiseaseCubitInitial extends DiseaseCubitState {}

final class DiseaseCubitLoading extends DiseaseCubitState {}

final class DiseaseCubitLoaded extends DiseaseCubitState {
  final List <Disease >result;

  DiseaseCubitLoaded(this.result);
}