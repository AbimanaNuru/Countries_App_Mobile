import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Repository/countries_repository.dart';
import '../../Data Layer/Models/countrySummary/country_summary.dart';

part 'country_summary_event.dart';
part 'country_summary_state.dart';

class CountrySummaryBloc
    extends Bloc<CountrySummaryEvent, CountrySummaryState> {
  CountrySummaryBloc({CountriesRepository? repository})
    : _repository = repository ?? CountriesRepository(),
      super(CountrySummaryInitial()) {
    on<LoadCountriesEvent>(_onLoadCountries);
    on<SearchCountriesEvent>(_onSearchCountries);
    on<RefreshCountriesEvent>(_onRefreshCountries);
  }

  final CountriesRepository _repository;

  Future<void> _onLoadCountries(
    LoadCountriesEvent event,
    Emitter<CountrySummaryState> emit,
  ) async {
    emit(CountrySummaryLoading());
    try {
      final countries = await _repository.getAllCountries();
      emit(CountrySummaryLoaded(countries));
    } catch (e) {
      emit(CountrySummaryError(e.toString()));
    }
  }

  Future<void> _onSearchCountries(
    SearchCountriesEvent event,
    Emitter<CountrySummaryState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(LoadCountriesEvent());
      return;
    }

    emit(CountrySummaryLoading());
    try {
      final countries = await _repository.searchCountries(event.query);
      if (countries.isEmpty) {
        emit(CountrySummaryEmpty(event.query));
      } else {
        emit(CountrySummaryLoaded(countries, isSearchResult: true));
      }
    } catch (e) {
      emit(CountrySummaryError(e.toString()));
    }
  }

  Future<void> _onRefreshCountries(
    RefreshCountriesEvent event,
    Emitter<CountrySummaryState> emit,
  ) async {
    try {
      // Use refreshCountries to bypass cache and get fresh data
      final countries = await _repository.refreshCountries();
      emit(CountrySummaryLoaded(countries));
    } catch (e) {
      // If refresh fails, try to get cached data
      try {
        final countries = await _repository.getAllCountries();
        emit(CountrySummaryLoaded(countries));
      } catch (_) {
        emit(CountrySummaryError(e.toString()));
      }
    }
  }
}
