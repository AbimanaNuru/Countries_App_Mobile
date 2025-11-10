part of 'favorites_country_bloc.dart';

sealed class FavoritesCountryState extends Equatable {
  const FavoritesCountryState();

  @override
  List<Object> get props => [];
}

/// Initial state
final class FavoritesCountryInitial extends FavoritesCountryState {}

/// Loading state
final class FavoritesCountryLoading extends FavoritesCountryState {}

/// Loaded state with list of favorite countries
final class FavoritesCountryLoaded extends FavoritesCountryState {
  const FavoritesCountryLoaded(this.favorites, this.favoriteCca2Codes);

  final List<CountrySummary> favorites;
  final Set<String> favoriteCca2Codes;

  bool isFavorite(String cca2) => favoriteCca2Codes.contains(cca2);

  @override
  List<Object> get props => [favorites, favoriteCca2Codes];
}

/// Error state
final class FavoritesCountryError extends FavoritesCountryState {
  const FavoritesCountryError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
