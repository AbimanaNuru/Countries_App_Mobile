import 'package:countries_mobile_app/app/UI/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic/FavoritesCountry/favorites_country_bloc.dart';
import '../../Data Layer/Models/countrySummary/country_summary.dart';
import '../Utils/Constants/Constants.dart';
import '../Utils/helpers.dart';
import '../Widgets/empty_state.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  void _navigateToDetail(BuildContext context, CountrySummary country) {
    if (country.cca2 != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(cca2Code: country.cca2!),
        ),
      );
    }
  }

  void _removeFavorite(BuildContext context, String cca2) {
    context.read<FavoritesCountryBloc>().add(RemoveFavoriteEvent(cca2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: CountryAppText.favorites,
        showBackButton: false,
      ),
      body: BlocBuilder<FavoritesCountryBloc, FavoritesCountryState>(
        builder: (context, state) {
          if (state is FavoritesCountryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FavoritesCountryError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            );
          }

          if (state is FavoritesCountryLoaded) {
            if (state.favorites.isEmpty) {
              return const EmptyState(
                message: CountryAppText.noFavorites,
                description: CountryAppText.noFavoritesDescription,
                icon: Icons.favorite_border,
              );
            }

            return ListView.builder(
              itemCount: state.favorites.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final country = state.favorites[index];
                return _FavoriteCard(
                  country: country,
                  onTap: () => _navigateToDetail(context, country),
                  onRemove: () => _removeFavorite(context, country.cca2 ?? ''),
                );
              },
            );
          }

          return const EmptyState(
            message: CountryAppText.noFavorites,
            description: CountryAppText.noFavoritesDescription,
            icon: Icons.favorite_border,
          );
        },
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  const _FavoriteCard({
    required this.country,
    required this.onTap,
    required this.onRemove,
  });

  final CountrySummary country;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final flagUrl = Helpers.getFlagUrl(country.flags);
    final countryName = Helpers.getCommonName(country.name);
    // final capital = country.capital?.isNotEmpty == true
    //     ? country.capital!.first
    //     : 'N/A';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Flag Image
              Hero(
                tag: 'flag_${country.cca2}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: flagUrl.isNotEmpty
                      ? Image.network(
                          flagUrl,
                          width: 60,
                          height: 45,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60,
                              height: 45,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.flag, size: 24),
                            );
                          },
                        )
                      : Container(
                          width: 60,
                          height: 45,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.flag, size: 24),
                        ),
                ),
              ),
              const SizedBox(width: 12),

              // Country Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AbeliaCoreColors.foreground,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Capital: Need custom',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // Remove Icon
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
