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
    required this.capital,
  });

  final DynamicObject? name;
  final DynamicObject? flags;
  final int? population;
  final String? cca2;
  final List<String>? capital;

  CountrySummary copyWith({
    DynamicObject? name,
    DynamicObject? flags,
    int? population,
    String? cca2,
    List<String>? capital,
  }) {
    return CountrySummary(
      name: name ?? this.name,
      flags: flags ?? this.flags,
      population: population ?? this.population,
      cca2: cca2 ?? this.cca2,
      capital: capital ?? this.capital,
    );
  }

  factory CountrySummary.fromJson(Map<String, dynamic> json) =>
      _$CountrySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$CountrySummaryToJson(this);

  @override
  String toString() =>
      'CountrySummary(name: $name, flags: $flags, population: $population, cca2: $cca2, capital: $capital)';

  @override
  List<Object?> get props => [name, flags, population, cca2, capital];
}

@JsonSerializable()
class DynamicObject extends Equatable {
  const DynamicObject({this.data});

  final dynamic data;

  factory DynamicObject.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return DynamicObject(data: json);
    }
    return DynamicObject(data: {'value': json});
  }

  dynamic toJson() => data;

  /// Helper to safely return string values when available
  String? get asString {
    if (data is String) return data as String?;
    if (data is Map<String, dynamic>) {
      return data['value'] as String?;
    }
    return null;
  }

  @override
  String toString() => data.toString();

  @override
  List<Object?> get props => [data];
}
