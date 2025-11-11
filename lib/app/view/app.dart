import 'package:countries_mobile_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Business Logic/CountrySummary/country_summary_bloc.dart';
import '../Business Logic/FavoritesCountry/favorites_country_bloc.dart';
import '../Business Logic/Theme/Theme.dart';
import '../Business Logic/Theme/ThemeComponent.dart';
import '../Data Layer/Repository/countries_repository.dart';
import '../UI/Screens/spalsh_screen.dart';

class App extends StatelessWidget {
  const App({super.key, this.sharedPreferences});

  final SharedPreferences? sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CountriesRepository(
            cacheService: sharedPreferences != null
                ? CacheService(sharedPreferences!)
                : null,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => CountrySummaryBloc(
              repository: context.read<CountriesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                FavoritesCountryBloc()..add(LoadFavoritesEvent()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              title: 'Countries App',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeState.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
