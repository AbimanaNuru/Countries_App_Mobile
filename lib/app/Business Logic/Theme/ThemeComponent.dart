import 'package:countries_mobile_app/app/UI/Utils/Constants/Constants.dart';
import 'package:flutter/material.dart';

/// ================================
/// THEME EXTENSION
/// ================================
@immutable
class AbeliaTheme extends ThemeExtension<AbeliaTheme> {
  const AbeliaTheme({
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

  @override
  AbeliaTheme copyWith({
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
  }) {
    return AbeliaTheme(
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
          bottomNavigationBarbackgroundColor ?? this.bottomNavigationBarbackgroundColor,
      bottomNavigationBarItemColor:
          bottomNavigationBarItemColor ?? this.bottomNavigationBarItemColor,
    );
  }

  @override
  AbeliaTheme lerp(ThemeExtension<AbeliaTheme>? other, double t) {
    if (other is! AbeliaTheme) return this;
    return AbeliaTheme(
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
    );
  }
}

/// ================================
/// APP THEME
/// ================================
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: AbeliaCoreColors.primary,
      secondary: AbeliaCoreColors.semiPrimary,
    ),
    scaffoldBackgroundColor: AbeliaCoreColors.white,
    dividerColor: AbeliaCoreColors.muted,
    extensions: [
      AbeliaTheme(
        appBarColor: AbeliaCoreColors.primary,
        backgroundColor: AbeliaCoreColors.white,
        semiBackgroundColor: AbeliaCoreColors.gray,
        textColor: AbeliaCoreColors.foreground,
        buttonColor: AbeliaCoreColors.primary,
        blackButtonColor: AbeliaCoreColors.black,
        iconColor: AbeliaCoreColors.primary,
        cardColor: AbeliaCoreColors.white,
        dividerColor: AbeliaCoreColors.muted,
        menuItemBackground: AbeliaCoreColors.semiPrimary,
        switchThumbColor: AbeliaCoreColors.white,
        switchTrackColor: AbeliaCoreColors.primary.withOpacity(0.4),
        profileHeaderColor: AbeliaCoreColors.black,
        semiPrimary: AbeliaCoreColors.semiPrimary,
        primary: AbeliaCoreColors.primary,
        cardBackgroundColor: AbeliaCoreColors.cardBackground,
        searchBarColor: AbeliaCoreColors.searchBarColor,
        borderColor: AbeliaCoreColors.borderColor,
        shimmerBaseColor: AbeliaCoreColors.shimmerBaseColor,
        shimmerHighlightColor: AbeliaCoreColors.shimmerHighlightColor,
        bottomNavigationBarbackgroundColor: AbeliaCoreColors.white,
        bottomNavigationBarItemColor: AbeliaCoreColors.black,
      ),
    ],
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: AbeliaCoreColors.primary,
      secondary: AbeliaCoreColors.semiPrimary,
      surface: AbeliaCoreColors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    dividerColor: Colors.grey[800],
    extensions: [
      AbeliaTheme(
        appBarColor: const Color(0xFF1F1F1F),
        backgroundColor: AbeliaCoreColors.black,
        semiBackgroundColor: const Color(0xFF1F1F1F),
        textColor: AbeliaCoreColors.white,
        buttonColor: AbeliaCoreColors.primary,
        blackButtonColor: AbeliaCoreColors.primary,
        iconColor: AbeliaCoreColors.primary,
        cardColor: const Color(0xFF1F1F1F),
        dividerColor: Colors.grey[800]!,
        menuItemBackground: const Color(0xFF303030),
        switchThumbColor: AbeliaCoreColors.primary,
        switchTrackColor: Colors.grey[600]!,
        profileHeaderColor: const Color(0xFF1F1F1F),
        semiPrimary: const Color(0xFF1F1F1F),
        primary: AbeliaCoreColors.black,
        cardBackgroundColor: const Color(0xFF1F1F1F),
        searchBarColor: const Color(0xFF2A2A2A),
        borderColor: Colors.grey,
        shimmerBaseColor: Colors.grey,
        shimmerHighlightColor: Colors.grey,
        bottomNavigationBarbackgroundColor: AbeliaCoreColors.black,
        bottomNavigationBarItemColor: AbeliaCoreColors.white,
      ),
    ],
  );
}
