import 'package:coder/moduls/direct_search/data/ICD10Data.dart';

List<ICD10Data> binarySearchByCode(List<ICD10Data> data, String query) {
  query = query.toLowerCase(); // Convert the query to lowercase

  int low = 0;
  int high = data.length - 1;

  while (low <= high) {
    int mid = low + ((high - low) / 2).floor();
    final comparison = data[mid].code.toLowerCase().compareTo(query); // Convert the data element to lowercase for comparison

    if (comparison == 0) {
      // Found a match, return the result.
      return [data[mid]];
    } else if (comparison < 0) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return [];
}

List<ICD10Data> binarySearchByDisease(List<ICD10Data> data, String query) {
  query = query.toLowerCase(); // Convert the query to lowercase

  int low = 0;
  int high = data.length - 1;

  while (low <= high) {
    int mid = low + ((high - low) / 2).floor();
    final comparison = data[mid].disease.toLowerCase().compareTo(query); // Convert the data element to lowercase for comparison

    if (comparison == 0) {
      // Found a match, return the result.
      return [data[mid]];
    } else if (comparison < 0) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return [];
}
