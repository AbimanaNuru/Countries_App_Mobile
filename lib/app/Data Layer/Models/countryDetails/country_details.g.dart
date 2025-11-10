// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) =>
    CountryDetails(
      flags:
          json['flags'] == null ? null : DynamicObject.fromJson(json['flags']),
      name: json['name'] == null ? null : DynamicObject.fromJson(json['name']),
      capital:
          (json['capital'] as List<dynamic>?)?.map((e) => e as String).toList(),
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
      area: (json['area'] as num?)?.toInt(),
      population: (json['population'] as num?)?.toInt(),
      timezones: (json['timezones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CountryDetailsToJson(CountryDetails instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'name': instance.name,
      'capital': instance.capital,
      'region': instance.region,
      'subregion': instance.subregion,
      'area': instance.area,
      'population': instance.population,
      'timezones': instance.timezones,
    };

DynamicObject _$DynamicObjectFromJson(Map<String, dynamic> json) =>
    DynamicObject(
      data: json['data'],
    );

Map<String, dynamic> _$DynamicObjectToJson(DynamicObject instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
