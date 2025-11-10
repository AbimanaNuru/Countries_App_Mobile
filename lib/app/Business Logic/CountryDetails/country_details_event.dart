part of 'country_details_bloc.dart';

sealed class CountryDetailsEvent extends Equatable {
  const CountryDetailsEvent();

  @override
  List<Object> get props => [];
}

/// Event to load country details by cca2 code
class LoadCountryDetailsEvent extends CountryDetailsEvent {
  const LoadCountryDetailsEvent(this.cca2Code);

  final String cca2Code;

  @override
  List<Object> get props => [cca2Code];
}
