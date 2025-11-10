import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/countryDetails/country_details.dart';
import '../Models/countrySummary/country_summary.dart';

/// API Service for REST Countries API
class CountriesApiService {
  static const String _baseUrl = 'https://restcountries.com/v3.1';

  /// Fetch all countries with minimal data for list view
  Future<List<CountrySummary>> getAllCountries() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/all?fields=name,flags,population,cca2'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map(
              (json) => CountrySummary.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Failed to load countries: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  /// Search countries by name with minimal data
  Future<List<CountrySummary>> searchCountries(String name) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/name/$name?fields=name,flags,population,cca2'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map(
              (json) => CountrySummary.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        throw Exception('Failed to search countries: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404')) {
        return [];
      }
      throw Exception('Error searching countries: $e');
    }
  }

  /// Fetch detailed country data by cca2 code
  Future<CountryDetails> getCountryDetails(String cca2Code) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/alpha/$cca2Code?fields=name,flags,population,capital,region,subregion,area,timezones',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return CountryDetails.fromJson(data);
      } else {
        throw Exception(
          'Failed to load country details: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching country details: $e');
    }
  }
}

/// Repository for countries data
class CountriesRepository {
  CountriesRepository({CountriesApiService? apiService})
    : _apiService = apiService ?? CountriesApiService();

  final CountriesApiService _apiService;

  Future<List<CountrySummary>> getAllCountries() async {
    return await _apiService.getAllCountries();
  }

  Future<List<CountrySummary>> searchCountries(String name) async {
    return await _apiService.searchCountries(name);
  }

  Future<CountryDetails> getCountryDetails(String cca2Code) async {
    return await _apiService.getCountryDetails(cca2Code);
  }
}
