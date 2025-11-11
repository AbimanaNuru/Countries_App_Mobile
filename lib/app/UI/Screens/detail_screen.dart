import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic/CountryDetails/country_details_bloc.dart';
import '../../Business Logic/Theme/ThemeComponent.dart';
import '../../Data Layer/Models/countryDetails/country_details.dart';
import '../../Data Layer/Repository/countries_repository.dart';
import '../Utils/Constants/Constants.dart';
import '../Utils/helpers.dart';
import '../Widgets/error_view.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.cca2Code});

  final String cca2Code;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryDetailsBloc(
        repository: CountriesRepository(),
      )..add(LoadCountryDetailsEvent(cca2Code)),
      child: _DetailScreenContent(cca2Code: cca2Code),
    );
  }
}

class _DetailScreenContent extends StatelessWidget {
  const _DetailScreenContent({required this.cca2Code});

  final String cca2Code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryDetailsBloc, CountryDetailsState>(
        builder: (context, state) {
          if (state is CountryDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CountryDetailsError) {
            return Scaffold(
              appBar: AppBar(),
              body: ErrorView(
                message: CountryAppText.errorLoadingDetails,
                onRetry: () {
                  context.read<CountryDetailsBloc>().add(
                    LoadCountryDetailsEvent(cca2Code),
                  );
                },
              ),
            );
          }

          if (state is CountryDetailsLoaded) {
            return _buildDetailContent(context, state.countryDetails);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context, CountryDetails details) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CountryAppTheme>();
    final flagUrl = Helpers.getFlagUrl(details.flags);
    final countryName = Helpers.getCommonName(details.name);
    final capital = Helpers.getCapital(details.capital);
    final population = Helpers.formatNumber(details.population);
    final area = Helpers.formatArea(details.area);

    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flag Image
            Hero(
              tag: 'flag_$cca2Code',
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: customTheme?.cardBackgroundColor ?? theme.cardColor,
                ),
                child: flagUrl.isNotEmpty
                    ? Image.network(
                        flagUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.flag,
                              size: 64,
                              color: theme.iconTheme.color,
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Icon(
                          Icons.flag,
                          size: 64,
                          color: theme.iconTheme.color,
                        ),
                      ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Key Statistics Section
                  Text(
                    CountryAppText.keyStatistics,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatisticsGrid(
                    context: context,
                    area: area,
                    population: population,
                    region: details.region ?? 'N/A',
                    subRegion: details.subregion ?? 'N/A',
                    capital: capital,
                  ),
                  const SizedBox(height: 24),

                  // Timezone Section
                  Text(
                    CountryAppText.timezone,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTimezones(context, details.timezones ?? []),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsGrid({
    required BuildContext context,
    required String area,
    required String population,
    required String region,
    required String subRegion,
    required String capital,
  }) {
    return Column(
      children: [
        _buildStatRow(
          context: context,
          label: CountryAppText.area,
          value: area,
        ),
        const SizedBox(height: 12),
        _buildStatRow(
          context: context,
          label: CountryAppText.population,
          value: population,
        ),
        const SizedBox(height: 12),
        _buildStatRow(
          context: context,
          label: CountryAppText.region,
          value: region,
        ),
        const SizedBox(height: 12),
        _buildStatRow(
          context: context,
          label: CountryAppText.subRegion,
          value: subRegion,
        ),
        const SizedBox(height: 12),
        _buildStatRow(
          context: context,
          label: CountryAppText.capital,
          value: capital,
        ),
      ],
    );
  }

  Widget _buildStatRow({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimezones(BuildContext context, List<String> timezones) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CountryAppTheme>();

    if (timezones.isEmpty) {
      return Text(
        'N/A',
        style: theme.textTheme.bodyLarge,
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: timezones.map((timezone) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: customTheme?.cardBackgroundColor ?? theme.cardColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: customTheme?.borderColor ?? Colors.grey.shade300,
            ),
          ),
          child: Text(
            timezone,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
