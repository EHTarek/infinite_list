import 'package:infinite_list/model/person_data_model.dart';

abstract class PersonData {
  PersonDataModel getData();
}

class PersonDataImpl implements PersonData {
  PersonDataModel model = PersonDataModel(name: 'Tariqul', age: '24');
  @override
  PersonDataModel getData() => model;
}
