import 'package:countries_mobile_app/app/Business%20Logic/Theme/Theme.dart';
import 'package:countries_mobile_app/app/Business%20Logic/Theme/ThemeComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  bool showBackButton = false,
}) {
  final theme = Theme.of(context);
  final customTheme = theme.extension<AbeliaTheme>();

  return AppBar(
    title: Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          )
        : null,
    actions: [
      ...?actions,
      // Add theme toggle button
      BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return IconButton(
            icon: Icon(
              state.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            tooltip: state.isDarkMode ? 'Light Mode' : 'Dark Mode',
          );
        },
      ),
    ],
    centerTitle: false,
    backgroundColor: theme.appBarTheme.backgroundColor,
    elevation: 0,
    scrolledUnderElevation: 1,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: theme.colorScheme.onSurface,
    ),
  );
}
