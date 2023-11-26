import 'package:bloc/bloc.dart';
import 'package:coder/moduls/deep_search/data/Disease.dart';
import 'package:coder/moduls/deep_search/domain/load_data.dart';
import 'package:equatable/equatable.dart';

part 'show_tree_state.dart';



class ShowTreeCubit extends Cubit<ShowTreeState> {
  Future<List<Disease>> rootDisease = convertToDisease();
  ShowTreeCubit() : super(ShowTreeInitial());

Future<List<Disease> >showTree() async {

  List<Disease> diseases = await rootDisease;

  emit(ShowTreeLoaded( diseases));
  return diseases;
}
void clearSearch() {
    // Clear the search results by emitting an initial state
    emit(ShowTreeInitial());
   
  }
}