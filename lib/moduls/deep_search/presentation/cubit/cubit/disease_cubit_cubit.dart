import 'package:bloc/bloc.dart';
import 'package:coder/moduls/deep_search/data/Disease.dart';
import 'package:coder/moduls/deep_search/domain/load_data.dart';
import 'package:equatable/equatable.dart';

part 'disease_cubit_state.dart';

class DiseaseCubitCubit extends Cubit<DiseaseCubitState> {
  Future<List<Disease>> rootDisease = convertToDisease();
  var search;
  
  DiseaseCubitCubit() : super(DiseaseCubitInitial());

Future< void >deepSearch(String targetCode) async {
  List<Disease> ourDiseases=[] ;

  emit(DiseaseCubitLoading());
  List<Disease> diseases = await rootDisease;
  for(int i=0, len = diseases.length; i < len; i++) {
    search = diseases[i].searchContainName(targetCode);
    if (search != null) {
  
      ourDiseases.add(search);
     
       
    }
  }
 
 emit(DiseaseCubitLoaded(ourDiseases));
}
void clearSearch() {
    // Clear the search results by emitting an initial state
    emit(DiseaseCubitInitial());
  }
}