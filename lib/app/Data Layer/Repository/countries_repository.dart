import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/countryDetails/country_details.dart';
import '../Models/countrySummary/country_summary.dart';

/// API Service for REST Countries API
class CountriesApiService {
  static String get _baseUrl => dotenv.env['BASE_URL']!;

  /// Fetch all countries with minimal data for list view
  Future<List<CountrySummary>> getAllCountries() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/all?fields=name,flags,population,cca2,capital'),
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

/// Cache service for storing countries data locally
class CacheService {
  static const String _countriesKey = 'cached_countries';
  static const String _lastUpdateKey = 'last_update_timestamp';
  static const Duration _cacheValidDuration = Duration(hours: 24);

  final SharedPreferences _prefs;

  CacheService(this._prefs);

  /// Save countries to cache
  Future<void> cacheCountries(List<CountrySummary> countries) async {
    try {
      final jsonList = countries.map((country) => country.toJson()).toList();
      final jsonString = json.encode(jsonList);
      await _prefs.setString(_countriesKey, jsonString);
      await _prefs.setInt(
        _lastUpdateKey,
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (e) {
      throw Exception('Failed to cache countries: $e');
    }
  }

  /// Get cached countries
  Future<List<CountrySummary>?> getCachedCountries() async {
    try {
      final jsonString = _prefs.getString(_countriesKey);
      if (jsonString == null) return null;

      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => CountrySummary.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to retrieve cached countries: $e');
    }
  }

  /// Check if cache is valid (not expired)
  bool isCacheValid() {
    final lastUpdate = _prefs.getInt(_lastUpdateKey);
    if (lastUpdate == null) return false;

    final lastUpdateTime = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
    final now = DateTime.now();
    final difference = now.difference(lastUpdateTime);

    return difference < _cacheValidDuration;
  }

  /// Clear all cached data
  Future<void> clearCache() async {
    await _prefs.remove(_countriesKey);
    await _prefs.remove(_lastUpdateKey);
  }
}

/// Repository for countries data with caching support
class CountriesRepository {
  CountriesRepository({
    CountriesApiService? apiService,
    CacheService? cacheService,
  }) : _apiService = apiService ?? CountriesApiService(),
       _cacheService = cacheService;

  final CountriesApiService _apiService;
  final CacheService? _cacheService;

  /// Get all countries with cache-first strategy
  Future<List<CountrySummary>> getAllCountries() async {
    // Try to get from cache first if cache service is available
    if (_cacheService != null && _cacheService!.isCacheValid()) {
      final cachedCountries = await _cacheService!.getCachedCountries();
      if (cachedCountries != null && cachedCountries.isNotEmpty) {
        return cachedCountries;
      }
    }

    // If no valid cache, fetch from API
    try {
      final countries = await _apiService.getAllCountries();
      // Cache the results
      if (_cacheService != null) {
        await _cacheService!.cacheCountries(countries);
      }
      return countries;
    } catch (e) {
      // If API fails, try to return stale cache as fallback
      if (_cacheService != null) {
        final cachedCountries = await _cacheService!.getCachedCountries();
        if (cachedCountries != null && cachedCountries.isNotEmpty) {
          return cachedCountries;
        }
      }
      rethrow;
    }
  }

  /// Search countries (no caching for search results)
  Future<List<CountrySummary>> searchCountries(String name) async {
    return await _apiService.searchCountries(name);
  }

  /// Get country details
  Future<CountryDetails> getCountryDetails(String cca2Code) async {
    return await _apiService.getCountryDetails(cca2Code);
  }

  /// Force refresh - bypasses cache and fetches fresh data
  Future<List<CountrySummary>> refreshCountries() async {
    final countries = await _apiService.getAllCountries();
    if (_cacheService != null) {
      await _cacheService!.cacheCountries(countries);
    }
    return countries;
  }
}
