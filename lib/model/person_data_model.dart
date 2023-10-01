class PersonDataModel {
  final String name;
  final String age;

  PersonDataModel({
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'Name: $name \nAge: $age';
  }
}
