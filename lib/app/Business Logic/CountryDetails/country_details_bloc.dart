import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data Layer/Models/countryDetails/country_details.dart';
import '../../Data Layer/Repository/countries_repository.dart';

part 'country_details_event.dart';
part 'country_details_state.dart';

class CountryDetailsBloc
    extends Bloc<CountryDetailsEvent, CountryDetailsState> {
  CountryDetailsBloc({CountriesRepository? repository})
    : _repository = repository ?? CountriesRepository(),
      super(CountryDetailsInitial()) {
    on<LoadCountryDetailsEvent>(_onLoadCountryDetails);
  }

  final CountriesRepository _repository;

  Future<void> _onLoadCountryDetails(
    LoadCountryDetailsEvent event,
    Emitter<CountryDetailsState> emit,
  ) async {
    emit(CountryDetailsLoading());
    try {
      final details = await _repository.getCountryDetails(event.cca2Code);
      emit(CountryDetailsLoaded(details));
    } catch (e) {
      emit(CountryDetailsError(e.toString()));
    }
  }
}
