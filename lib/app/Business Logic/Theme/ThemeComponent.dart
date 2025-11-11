import 'package:countries_mobile_app/app/UI/Utils/Constants/Constants.dart';
import 'package:flutter/material.dart';

/// ================================
/// THEME EXTENSION
/// ================================
@immutable
class CountryAppTheme extends ThemeExtension<CountryAppTheme> {
  const CountryAppTheme({
    required this.appBarColor,
    required this.backgroundColor,
    required this.semiBackgroundColor,
    required this.textColor,
    required this.buttonColor,
    required this.blackButtonColor,
    required this.iconColor,
    required this.cardColor,
    required this.dividerColor,
    required this.menuItemBackground,
    required this.switchThumbColor,
    required this.switchTrackColor,
    required this.profileHeaderColor,
    required this.semiPrimary,
    required this.primary,
    required this.cardBackgroundColor,
    required this.searchBarColor,
    required this.borderColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.bottomNavigationBarbackgroundColor,
    required this.bottomNavigationBarItemColor,
    required this.cardShimmerBackgroundColor,
    required this.splashScreenBackgroundColor,
  });

  final Color appBarColor;
  final Color backgroundColor;
  final Color semiBackgroundColor;
  final Color textColor;
  final Color buttonColor;
  final Color blackButtonColor;
  final Color iconColor;
  final Color cardColor;
  final Color dividerColor;
  final Color menuItemBackground;
  final Color switchThumbColor;
  final Color switchTrackColor;
  final Color profileHeaderColor;
  final Color semiPrimary;
  final Color primary;

  // New Fields
  final Color cardBackgroundColor;
  final Color searchBarColor;
  final Color borderColor;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color bottomNavigationBarbackgroundColor;
  final Color bottomNavigationBarItemColor;
  final Color cardShimmerBackgroundColor;
  final Color splashScreenBackgroundColor;

  @override
  CountryAppTheme copyWith({
    Color? appBarColor,
    Color? backgroundColor,
    Color? semiBackgroundColor,
    Color? textColor,
    Color? buttonColor,
    Color? blackButtonColor,
    Color? iconColor,
    Color? cardColor,
    Color? dividerColor,
    Color? menuItemBackground,
    Color? switchThumbColor,
    Color? switchTrackColor,
    Color? profileHeaderColor,
    Color? semiPrimary,
    Color? primary,
    Color? cardBackgroundColor,
    Color? searchBarColor,
    Color? borderColor,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Color? bottomNavigationBarbackgroundColor,
    Color? bottomNavigationBarItemColor,
    Color? cardShimmerBackgroundColor,
    Color? splashScreenBackgroundColor,
  }) {
    return CountryAppTheme(
      appBarColor: appBarColor ?? this.appBarColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      semiBackgroundColor: semiBackgroundColor ?? this.semiBackgroundColor,
      textColor: textColor ?? this.textColor,
      buttonColor: buttonColor ?? this.buttonColor,
      blackButtonColor: blackButtonColor ?? this.blackButtonColor,
      iconColor: iconColor ?? this.iconColor,
      cardColor: cardColor ?? this.cardColor,
      dividerColor: dividerColor ?? this.dividerColor,
      menuItemBackground: menuItemBackground ?? this.menuItemBackground,
      switchThumbColor: switchThumbColor ?? this.switchThumbColor,
      switchTrackColor: switchTrackColor ?? this.switchTrackColor,
      profileHeaderColor: profileHeaderColor ?? this.profileHeaderColor,
      semiPrimary: semiPrimary ?? this.semiPrimary,
      primary: primary ?? this.primary,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      searchBarColor: searchBarColor ?? this.searchBarColor,
      borderColor: borderColor ?? this.borderColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
      bottomNavigationBarbackgroundColor:
          bottomNavigationBarbackgroundColor ??
          this.bottomNavigationBarbackgroundColor,
      bottomNavigationBarItemColor:
          bottomNavigationBarItemColor ?? this.bottomNavigationBarItemColor,
      cardShimmerBackgroundColor:
          cardShimmerBackgroundColor ?? this.cardShimmerBackgroundColor,
      splashScreenBackgroundColor:
          splashScreenBackgroundColor ?? this.splashScreenBackgroundColor,
    );
  }

  @override
  CountryAppTheme lerp(ThemeExtension<CountryAppTheme>? other, double t) {
    if (other is! CountryAppTheme) return this;
    return CountryAppTheme(
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      semiBackgroundColor: Color.lerp(
        semiBackgroundColor,
        other.semiBackgroundColor,
        t,
      )!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      blackButtonColor: Color.lerp(
        blackButtonColor,
        other.blackButtonColor,
        t,
      )!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      menuItemBackground: Color.lerp(
        menuItemBackground,
        other.menuItemBackground,
        t,
      )!,
      switchThumbColor: Color.lerp(
        switchThumbColor,
        other.switchThumbColor,
        t,
      )!,
      switchTrackColor: Color.lerp(
        switchTrackColor,
        other.switchTrackColor,
        t,
      )!,
      profileHeaderColor: Color.lerp(
        profileHeaderColor,
        other.profileHeaderColor,
        t,
      )!,
      semiPrimary: Color.lerp(semiPrimary, other.semiPrimary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      cardBackgroundColor: Color.lerp(
        cardBackgroundColor,
        other.cardBackgroundColor,
        t,
      )!,
      searchBarColor: Color.lerp(searchBarColor, other.searchBarColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      shimmerBaseColor: Color.lerp(
        shimmerBaseColor,
        other.shimmerBaseColor,
        t,
      )!,
      shimmerHighlightColor: Color.lerp(
        shimmerHighlightColor,
        other.shimmerHighlightColor,
        t,
      )!,
      bottomNavigationBarbackgroundColor: Color.lerp(
        bottomNavigationBarbackgroundColor,
        other.bottomNavigationBarbackgroundColor,
        t,
      )!,
      bottomNavigationBarItemColor: Color.lerp(
        bottomNavigationBarItemColor,
        other.bottomNavigationBarItemColor,
        t,
      )!,
      cardShimmerBackgroundColor: Color.lerp(
        cardShimmerBackgroundColor,
        other.cardShimmerBackgroundColor,
        t,
      )!,
      splashScreenBackgroundColor: Color.lerp(
        splashScreenBackgroundColor,
        other.splashScreenBackgroundColor,
        t,
      )!,
    );
  }
}

/// ================================
/// APP THEME
/// ================================
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: CountryAppCoreColors.primary,
      secondary: CountryAppCoreColors.semiPrimary,
    ),
    scaffoldBackgroundColor: CountryAppCoreColors.white,
    dividerColor: CountryAppCoreColors.muted,
    extensions: [
      CountryAppTheme(
        appBarColor: CountryAppCoreColors.primary,
        backgroundColor: CountryAppCoreColors.white,
        semiBackgroundColor: CountryAppCoreColors.gray,
        textColor: CountryAppCoreColors.foreground,
        buttonColor: CountryAppCoreColors.primary,
        blackButtonColor: CountryAppCoreColors.black,
        iconColor: CountryAppCoreColors.primary,
        cardColor: CountryAppCoreColors.white,
        dividerColor: CountryAppCoreColors.muted,
        menuItemBackground: CountryAppCoreColors.semiPrimary,
        switchThumbColor: CountryAppCoreColors.white,
        switchTrackColor: CountryAppCoreColors.primary.withOpacity(0.4),
        profileHeaderColor: CountryAppCoreColors.black,
        semiPrimary: CountryAppCoreColors.semiPrimary,
        primary: CountryAppCoreColors.primary,
        cardBackgroundColor: CountryAppCoreColors.cardBackground,
        searchBarColor: CountryAppCoreColors.searchBarColor,
        borderColor: CountryAppCoreColors.borderColor,
        shimmerBaseColor: CountryAppCoreColors.shimmerBaseColor,
        shimmerHighlightColor: CountryAppCoreColors.shimmerHighlightColor,
        bottomNavigationBarbackgroundColor: CountryAppCoreColors.white,
        bottomNavigationBarItemColor: CountryAppCoreColors.black,
        cardShimmerBackgroundColor: CountryAppCoreColors.shimmerForegroundColor,
        splashScreenBackgroundColor: CountryAppCoreColors.black,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: CountryAppCoreColors.primary,
      secondary: CountryAppCoreColors.semiPrimary,
      surface: CountryAppCoreColors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    dividerColor: Colors.grey[800],
    extensions: [
      CountryAppTheme(
        appBarColor: const Color(0xFF1F1F1F),
        backgroundColor: CountryAppCoreColors.black,
        semiBackgroundColor: const Color(0xFF1F1F1F),
        textColor: CountryAppCoreColors.white,
        buttonColor: CountryAppCoreColors.primary,
        blackButtonColor: CountryAppCoreColors.primary,
        iconColor: CountryAppCoreColors.primary,
        cardColor: const Color(0xFF1F1F1F),
        dividerColor: Colors.grey[800]!,
        menuItemBackground: const Color(0xFF303030),
        switchThumbColor: CountryAppCoreColors.primary,
        switchTrackColor: Colors.grey[600]!,
        profileHeaderColor: const Color(0xFF1F1F1F),
        semiPrimary: const Color(0xFF1F1F1F),
        primary: CountryAppCoreColors.black,
        cardBackgroundColor: const Color(0xFF1F1F1F),
        searchBarColor: const Color(0xFF2A2A2A),
        borderColor: Colors.grey,
        shimmerBaseColor: Colors.grey,
        shimmerHighlightColor: Colors.grey,
        bottomNavigationBarbackgroundColor: CountryAppCoreColors.black,
        bottomNavigationBarItemColor: CountryAppCoreColors.white,
        cardShimmerBackgroundColor: CountryAppCoreColors.foreground,
        splashScreenBackgroundColor: CountryAppCoreColors.black,
      ),
    ],
  );
}
