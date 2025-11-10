// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountrySummary _$CountrySummaryFromJson(Map<String, dynamic> json) =>
    CountrySummary(
      name: json['name'] == null ? null : DynamicObject.fromJson(json['name']),
      flags:
          json['flags'] == null ? null : DynamicObject.fromJson(json['flags']),
      population: (json['population'] as num?)?.toInt(),
      cca2: json['cca2'] as String?,
    );

Map<String, dynamic> _$CountrySummaryToJson(CountrySummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
      'population': instance.population,
      'cca2': instance.cca2,
    };

DynamicObject _$DynamicObjectFromJson(Map<String, dynamic> json) =>
    DynamicObject(
      data: json['data'],
    );

Map<String, dynamic> _$DynamicObjectToJson(DynamicObject instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
