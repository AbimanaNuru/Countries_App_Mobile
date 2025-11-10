part of 'favorites_country_bloc.dart';

sealed class FavoritesCountryEvent extends Equatable {
  const FavoritesCountryEvent();

  @override
  List<Object> get props => [];
}

/// Event to load favorites from local storage
class LoadFavoritesEvent extends FavoritesCountryEvent {}

/// Event to toggle favorite status of a country
class ToggleFavoriteEvent extends FavoritesCountryEvent {
  const ToggleFavoriteEvent(this.country);

  final CountrySummary country;

  @override
  List<Object> get props => [country];
}

/// Event to remove a country from favorites
class RemoveFavoriteEvent extends FavoritesCountryEvent {
  const RemoveFavoriteEvent(this.cca2);

  final String cca2;

  @override
  List<Object> get props => [cca2];
}
