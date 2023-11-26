part of 'show_tree_cubit.dart';

sealed class ShowTreeState extends Equatable {
  const ShowTreeState();

  @override
  List<Object> get props => [];
}

final class ShowTreeInitial extends ShowTreeState {}

final class ShowTreeLoading extends ShowTreeState {}

final class ShowTreeLoaded extends ShowTreeState {
  final List<Disease> diseases;

  ShowTreeLoaded(this.diseases);

  @override
  List<Object> get props => [diseases];
}