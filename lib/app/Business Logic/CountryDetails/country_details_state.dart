part of 'country_details_bloc.dart';

sealed class CountryDetailsState extends Equatable {
  const CountryDetailsState();

  @override
  List<Object> get props => [];
}

/// Initial state
final class CountryDetailsInitial extends CountryDetailsState {}

/// Loading state
final class CountryDetailsLoading extends CountryDetailsState {}

/// Success state with country details
final class CountryDetailsLoaded extends CountryDetailsState {
  const CountryDetailsLoaded(this.countryDetails);

  final CountryDetails countryDetails;

  @override
  List<Object> get props => [countryDetails];
}

/// Error state
final class CountryDetailsError extends CountryDetailsState {
  const CountryDetailsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
