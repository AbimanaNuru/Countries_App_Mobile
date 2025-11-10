import 'package:intl/intl.dart';

class Helpers {
  /// Format population number with M/K suffix
  static String formatPopulation(int? population) {
    if (population == null) return 'N/A';
    
    if (population >= 1000000) {
      return '${(population / 1000000).toStringAsFixed(1)}M';
    } else if (population >= 1000) {
      return '${(population / 1000).toStringAsFixed(1)}K';
    }
    return population.toString();
  }
  
  /// Format area with commas
  static String formatArea(int? area) {
    if (area == null) return 'N/A';
    final formatter = NumberFormat('#,###');
    return '${formatter.format(area)} km²';
  }
  
  /// Format number with commas
  static String formatNumber(int? number) {
    if (number == null) return 'N/A';
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }
  
  /// Extract common name from DynamicObject
  static String getCommonName(dynamic nameObject) {
    if (nameObject == null) return 'Unknown';
    
    if (nameObject is Map) {
      return nameObject['common']?.toString() ?? 'Unknown';
    }
    
    // Handle DynamicObject
    final data = nameObject.data;
    if (data is Map) {
      return data['common']?.toString() ?? 'Unknown';
    }
    
    return nameObject.toString();
  }
  
  /// Extract flag URL from DynamicObject
  static String getFlagUrl(dynamic flagsObject) {
    if (flagsObject == null) return '';
    
    if (flagsObject is Map) {
      return flagsObject['png']?.toString() ?? flagsObject['svg']?.toString() ?? '';
    }
    
    // Handle DynamicObject
    final data = flagsObject.data;
    if (data is Map) {
      return data['png']?.toString() ?? data['svg']?.toString() ?? '';
    }
    
    return '';
  }
  
  /// Get first capital city
  static String getCapital(List<String>? capitals) {
    if (capitals == null || capitals.isEmpty) return 'N/A';
    return capitals.first;
  }
}