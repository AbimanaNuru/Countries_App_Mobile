import 'package:countries_mobile_app/app/UI/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic/CountrySummary/country_summary_bloc.dart';
import '../../Business Logic/FavoritesCountry/favorites_country_bloc.dart';
import '../../Data Layer/Models/countrySummary/country_summary.dart';
import '../Utils/Constants/Constants.dart';
import '../Widgets/country_card.dart';
import '../Widgets/empty_state.dart';
import '../Widgets/error_view.dart';
import '../Widgets/loading_shimmer.dart';
import '../Widgets/search_bar_widget.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<CountrySummaryBloc>().add(LoadCountriesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (query.isEmpty) {
      context.read<CountrySummaryBloc>().add(LoadCountriesEvent());
    } else {
      // Debounce search - wait for user to stop typing
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_searchQuery == query) {
          context.read<CountrySummaryBloc>().add(SearchCountriesEvent(query));
        }
      });
    }
  }

  Future<void> _onRefresh() async {
    context.read<CountrySummaryBloc>().add(RefreshCountriesEvent());
    // Wait for the bloc to emit a new state
    await context.read<CountrySummaryBloc>().stream.first;
  }

  void _navigateToDetail(CountrySummary country) {
    if (country.cca2 != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(cca2Code: country.cca2!),
        ),
      );
    }
  }

  void _toggleFavorite(CountrySummary country) {
    context.read<FavoritesCountryBloc>().add(ToggleFavoriteEvent(country));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Countries',
        showBackButton: false,
      ),
      body: Column(
        children: [
          SearchBarWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(
            child: BlocBuilder<CountrySummaryBloc, CountrySummaryState>(
              builder: (context, state) {
                if (state is CountrySummaryLoading) {
                  return const LoadingShimmer();
                }

                if (state is CountrySummaryError) {
                  return ErrorView(
                    message: CountryAppText.errorLoadingCountries,
                    onRetry: () {
                      context.read<CountrySummaryBloc>().add(
                        LoadCountriesEvent(),
                      );
                    },
                  );
                }

                if (state is CountrySummaryEmpty) {
                  return EmptyState(
                    message: CountryAppText.noCountriesFound,
                    description: 'Try searching for "${state.query}"',
                  );
                }

                if (state is CountrySummaryLoaded) {
                  return RefreshIndicator(
                    onRefresh: _onRefresh,
                    child:
                        BlocBuilder<
                          FavoritesCountryBloc,
                          FavoritesCountryState
                        >(
                          builder: (context, favState) {
                            final favoriteCodes =
                                favState is FavoritesCountryLoaded
                                ? favState.favoriteCca2Codes
                                : <String>{};

                            return ListView.builder(
                              itemCount: state.countries.length,
                              padding: const EdgeInsets.only(bottom: 16),
                              itemBuilder: (context, index) {
                                final country = state.countries[index];
                                final isFavorite = favoriteCodes.contains(
                                  country.cca2,
                                );

                                return CountryCard(
                                  country: country,
                                  onTap: () => _navigateToDetail(country),
                                  isFavorite: isFavorite,
                                  onFavoriteToggle: () =>
                                      _toggleFavorite(country),
                                );
                              },
                            );
                          },
                        ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
