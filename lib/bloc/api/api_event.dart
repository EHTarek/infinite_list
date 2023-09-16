import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {}

class ApiEventGetAirlineList extends ApiEvent {
  final int page;
  final int size;

  ApiEventGetAirlineList({required this.page, required this.size});

  @override
  List<Object> get props => [page, size];
}
