import 'package:equatable/equatable.dart';
import 'package:infinite_list/model/airline_data_model.dart';

abstract class ApiState extends Equatable {}

class ApiStateInitial extends ApiState {
  @override
  List<Object?> get props => [];
}

class ApiStateLoaded extends ApiState {
  final AirlineDataModel listAirline;

  ApiStateLoaded(this.listAirline);

  @override
  List<Object?> get props => [];
}

class ApiStateError extends ApiState {
  final int? errorCode;
  final String? message;

  ApiStateError(this.errorCode, this.message);

  @override
  List<Object?> get props => [];
}
