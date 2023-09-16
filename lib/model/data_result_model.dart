import 'dart:convert';

List<DataResultModel> dataResultModelFromJson(String str) => List<DataResultModel>.from(json.decode(str).map((x) => DataResultModel.fromJson(x)));

String dataResultModelToJson(List<DataResultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataResultModel {
  final String id;
  final String name;
  final int trips;
  final List<Airline> airline;
  final int v;

  DataResultModel({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  factory DataResultModel.fromJson(Map<String, dynamic> json) => DataResultModel(
    id: json["_id"],
    name: json["name"],
    trips: json["trips"],
    airline: List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "trips": trips,
    "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
    "__v": v,
  };
}

class Airline {
  final String id;
  final int airlineId;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  final String headQuaters;
  final String website;
  final String established;
  final int v;

  Airline({
    required this.id,
    required this.airlineId,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
    required this.v,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    id: json["_id"],
    airlineId: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    slogan: json["slogan"],
    headQuaters: json["head_quaters"],
    website: json["website"],
    established: json["established"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": airlineId,
    "name": name,
    "country": country,
    "logo": logo,
    "slogan": slogan,
    "head_quaters": headQuaters,
    "website": website,
    "established": established,
    "__v": v,
  };
}
