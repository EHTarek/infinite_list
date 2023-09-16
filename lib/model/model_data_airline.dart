import 'model_item_airline.dart';

class Data {
  String? sId;
  String? name;
  int? trips;
  List<Airline>? airline;
  int? iV;

  Data({this.sId, this.name, this.trips, this.airline, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    if (json['airline'] != null) {
      airline = <Airline>[];
      json['airline'].forEach((v) {
        airline!.add(Airline.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['trips'] = trips;
    if (airline != null) {
      data['airline'] = airline!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}