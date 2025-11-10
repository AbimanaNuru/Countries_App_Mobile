part of 'country_summary_bloc.dart';

sealed class CountrySummaryEvent extends Equatable {
  const CountrySummaryEvent();

  @override
  List<Object> get props => [];
}

/// Event to load all countries
class LoadCountriesEvent extends CountrySummaryEvent {}

/// Event to search countries by name
class SearchCountriesEvent extends CountrySummaryEvent {
  const SearchCountriesEvent(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

/// Event to refresh countries list
class RefreshCountriesEvent extends CountrySummaryEvent {}
