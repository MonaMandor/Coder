class Disease {
  String name;
  String code;
  List<Disease> subDiseases;

  Disease({required this.name, required this.code, this.subDiseases = const <Disease>[]});

  factory Disease.convertToDisease(Map<String, dynamic> data) {
    var m = data['diag'] == null;

    Disease? disease;
    if (data['diag'] is Map) {
      disease = Disease.convertToDisease(data['diag']);
      return Disease(
        name: data['name'],
        code: data['code'] ?? '',
        subDiseases: [disease],
      );
    }
  
    var v = m ? <Disease>[] : (data['diag'] as List).map((subData) => Disease.convertToDisease(subData)).toList();

    try {
      return Disease(
        name: data['name'],
        code: data['code'] ?? '',
        subDiseases: v ,
      );
    } on Exception {
      print('error data');
      print(data);
      rethrow;
    }
  }
  Disease? searchByCode(String code) {
    if (this.code == code) {
      return this;
    }
    for (var subDisease in subDiseases) {
      var found = subDisease.searchByCode(code);
      if (found != null) {
        return found;
      }
    }
    return null;
    // return this;
  }
  Disease? searchByName(String name) {
  // Normalize the name and target name by trimming and converting to lowercase
  String normalizedName = name.trim().toLowerCase();
  String normalizedTargetName = this.name.trim().toLowerCase();

  if (normalizedTargetName == normalizedName) {
    return this;
  }

  for (var subDisease in subDiseases) {
    var found = subDisease.searchByName(name);
    if (found != null) {
      return found;
    }
  }

  return null;
}
 Disease? searchContainName(String name) {
  // Normalize the name and target name by trimming and converting to lowercase
  String normalizedName = name.trim().toLowerCase();
  String normalizedTargetName = this.name.trim().toLowerCase();

  if ( normalizedTargetName.contains( normalizedName )) {
    return this;
  }

  for (var subDisease in subDiseases) {
    var found = subDisease.searchByName(name);
    if (found != null) {
      return found;
    }
  }

  return null;
}

  @override
  String toString() => 'Disease(name: $name, code: $code, subDiseases: $subDiseases)';
}