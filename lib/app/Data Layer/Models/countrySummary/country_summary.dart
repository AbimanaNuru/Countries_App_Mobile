import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_summary.g.dart';

@JsonSerializable()
class CountrySummary extends Equatable {
  const CountrySummary({
    required this.name,
    required this.flags,
    required this.population,
    required this.cca2,
  });

  final DynamicObject? name;
  final DynamicObject? flags;
  final int? population;
  final String? cca2;

  CountrySummary copyWith({
    DynamicObject? name,
    DynamicObject? flags,
    int? population,
    String? cca2,
  }) {
    return CountrySummary(
      name: name ?? this.name,
      flags: flags ?? this.flags,
      population: population ?? this.population,
      cca2: cca2 ?? this.cca2,
    );
  }

  factory CountrySummary.fromJson(Map<String, dynamic> json) =>
      _$CountrySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$CountrySummaryToJson(this);

  @override
  String toString() =>
      "CountrySummary(name: $name, flags: $flags, population: $population, cca2: $cca2)";

  @override
  List<Object?> get props => [name, flags, population, cca2];
}

@JsonSerializable()
class DynamicObject extends Equatable {
  const DynamicObject({this.data});

  /// Store any type of JSON object here (string, int, map, etc.)
  final dynamic data;

  factory DynamicObject.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return DynamicObject(data: json);
    } else {
      // If it's just a string (e.g. "Syria")
      return DynamicObject(data: {'value': json});
    }
  }

  dynamic toJson() => data;

  @override
  String toString() => data.toString();

  @override
  List<Object?> get props => [data];
}
