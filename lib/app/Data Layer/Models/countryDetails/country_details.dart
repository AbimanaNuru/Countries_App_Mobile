import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_details.g.dart';

@JsonSerializable()
class CountryDetails extends Equatable {
  const CountryDetails({
    required this.flags,
    required this.name,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.area,
    required this.population,
    required this.timezones,
  });

  final DynamicObject? flags;
  final DynamicObject? name;
  final List<String>? capital;
  final String? region;
  final String? subregion;
  final int? area;
  final int? population;
  final List<String>? timezones;

  CountryDetails copyWith({
    DynamicObject? flags,
    DynamicObject? name,
    List<String>? capital,
    String? region,
    String? subregion,
    int? area,
    int? population,
    List<String>? timezones,
  }) {
    return CountryDetails(
      flags: flags ?? this.flags,
      name: name ?? this.name,
      capital: capital ?? this.capital,
      region: region ?? this.region,
      subregion: subregion ?? this.subregion,
      area: area ?? this.area,
      population: population ?? this.population,
      timezones: timezones ?? this.timezones,
    );
  }

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailsToJson(this);

  @override
  String toString() {
    return "CountryDetails(flags: $flags, name: $name, capital: $capital, region: $region, subregion: $subregion, area: $area, population: $population, timezones: $timezones)";
  }

  @override
  List<Object?> get props => [
    flags,
    name,
    capital,
    region,
    subregion,
    area,
    population,
    timezones,
  ];
}

@JsonSerializable()
class DynamicObject extends Equatable {
  const DynamicObject({this.data});

  /// Handles dynamic JSON (map or string)
  final dynamic data;

  factory DynamicObject.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return DynamicObject(data: json);
    } else {
      return DynamicObject(data: {'value': json});
    }
  }

  dynamic toJson() => data;

  @override
  String toString() => data.toString();

  @override
  List<Object?> get props => [data];
}
