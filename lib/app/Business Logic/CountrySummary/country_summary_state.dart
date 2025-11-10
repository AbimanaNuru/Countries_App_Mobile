part of 'country_summary_bloc.dart';

sealed class CountrySummaryState extends Equatable {
  const CountrySummaryState();

  @override
  List<Object> get props => [];
}

/// Initial state
final class CountrySummaryInitial extends CountrySummaryState {}

/// Loading state
final class CountrySummaryLoading extends CountrySummaryState {}

/// Success state with countries data
final class CountrySummaryLoaded extends CountrySummaryState {
  const CountrySummaryLoaded(this.countries, {this.isSearchResult = false});

  final List<CountrySummary> countries;
  final bool isSearchResult;

  @override
  List<Object> get props => [countries, isSearchResult];
}

/// Error state
final class CountrySummaryError extends CountrySummaryState {
  const CountrySummaryError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

/// Empty search result state
final class CountrySummaryEmpty extends CountrySummaryState {
  const CountrySummaryEmpty(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
