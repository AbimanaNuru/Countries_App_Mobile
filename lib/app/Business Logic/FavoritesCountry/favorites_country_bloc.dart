import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data Layer/Models/countrySummary/country_summary.dart';

part 'favorites_country_event.dart';
part 'favorites_country_state.dart';

class FavoritesCountryBloc
    extends Bloc<FavoritesCountryEvent, FavoritesCountryState> {
  FavoritesCountryBloc() : super(FavoritesCountryInitial()) {
    on<LoadFavoritesEvent>(_onLoadFavorites);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
  }

  static const String _favoritesKey = 'favorite_countries';

  Future<void> _onLoadFavorites(
    LoadFavoritesEvent event,
    Emitter<FavoritesCountryState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      final favorites = favoritesJson
          .map((json) => CountrySummary.fromJson(jsonDecode(json) as Map<String, dynamic>))
          .toList();

      final cca2Codes = favorites
          .map((country) => country.cca2 ?? '')
          .where((code) => code.isNotEmpty)
          .toSet();

      emit(FavoritesCountryLoaded(favorites, cca2Codes));
    } catch (e) {
      emit(FavoritesCountryError(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<FavoritesCountryState> emit,
  ) async {
    try {
      final currentState = state;
      List<CountrySummary> favorites = [];
      Set<String> cca2Codes = {};

      if (currentState is FavoritesCountryLoaded) {
        favorites = List.from(currentState.favorites);
        cca2Codes = Set.from(currentState.favoriteCca2Codes);
      }

      final cca2 = event.country.cca2 ?? '';
      if (cca2.isEmpty) return;

      if (cca2Codes.contains(cca2)) {
        // Remove from favorites
        favorites.removeWhere((c) => c.cca2 == cca2);
        cca2Codes.remove(cca2);
      } else {
        // Add to favorites
        favorites.add(event.country);
        cca2Codes.add(cca2);
      }

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = favorites
          .map((country) => jsonEncode(country.toJson()))
          .toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);

      emit(FavoritesCountryLoaded(favorites, cca2Codes));
    } catch (e) {
      emit(FavoritesCountryError(e.toString()));
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoritesCountryState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! FavoritesCountryLoaded) return;

      final favorites = List<CountrySummary>.from(currentState.favorites)
        ..removeWhere((c) => c.cca2 == event.cca2);

      final cca2Codes = Set<String>.from(currentState.favoriteCca2Codes)
        ..remove(event.cca2);

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = favorites
          .map((country) => jsonEncode(country.toJson()))
          .toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);

      emit(FavoritesCountryLoaded(favorites, cca2Codes));
    } catch (e) {
      emit(FavoritesCountryError(e.toString()));
    }
  }
}
