import 'package:flutter/material.dart';
import '../../Data Layer/Models/countrySummary/country_summary.dart';
import '../Utils/Constants/Constants.dart';
import '../Utils/helpers.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  final CountrySummary country;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final flagUrl = Helpers.getFlagUrl(country.flags);
    final countryName = Helpers.getCommonName(country.name);
    final population = Helpers.formatPopulation(country.population);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      'Population: $population',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Favorite Icon
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}