# 🌍 Countries Mobile App

[![coverage][coverage_badge]][coverage_link]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Flutter][flutter_badge]][flutter_link]

A beautiful, feature-rich Flutter application for exploring countries around the world. Built with modern Flutter practices and clean architecture.

## ✨ Features

- 🌎 Browse all countries with key information
- � Search for specific countries
- ⭐ Mark countries as favorites for quick access
- 🌓 Light & Dark theme support
- 📱 Responsive design for all screen sizes
- 🚀 Bloc state management
- 🌐 Internationalization support

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio with Flutter plugins

### Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/countries-mobile-app.git
   cd countries-mobile-app
   ```

2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the app**
   ```sh
   # For development
   flutter run --flavor development --target lib/main_development.dart
   
   # For staging
   flutter run --flavor staging --target lib/main_staging.dart
   
   # For production
   flutter run --flavor production --target lib/main_production.dart
   ```

### Project Structure

```
lib/
├── app/
│   ├── Business Logic/     # BLoCs, Events, States
│   ├── Data Layer/         # Models, Repositories, Data Sources
│   ├── UI/                 # Screens, Widgets, Themes
│   └── Utils/              # Helpers, Constants
├── l10n/                   # Localization files
└── main_development.dart   # Entry points
```

## 🧪 Testing

Run the following command to execute all tests:

```sh
# Run all tests with coverage
very_good test --coverage --test-randomize-ordering-seed random

# Generate HTML coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/
open coverage/index.html

# Run specific test file
flutter test test/path/to/test_file.dart
```

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - Beautiful native apps in record time
- [Bloc](https://bloclibrary.dev/) - Predictable state management
- [Dio](https://pub.dev/packages/dio) - Powerful HTTP client
- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Local storage for favorites
- [Flutter Localizations](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) - Internationalization support
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis) - Linting rules

## 🌐 Localization

This app supports multiple languages using Flutter's built-in internationalization. Here's how to work with translations:

### Adding New Strings

1. **Add the string** to `lib/l10n/arb/app_en.arb`:
   ```arb
   {
     "@@locale": "en",
     "appTitle": "Countries App",
     "@appTitle": {
       "description": "The title of the application"
     },
     "searchHint": "Search countries...",
     "@searchHint": {
       "description": "Hint text for search field"
     }
   }
   ```

2. **Use the string** in your code:
   ```dart
   Text(context.l10n.appTitle)
   ```

### Adding a New Language

1. Create a new ARB file in `lib/l10n/arb/` (e.g., `app_es.arb`)
2. Add translations for all strings
3. Update supported locales in `lib/l10n/l10n.dart`
4. Run code generation:
   ```sh
   flutter gen-l10n
   ```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [REST Countries API](https://restcountries.com/) for the country data
- [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli) for project setup
- Flutter community for awesome packages and support

---

<div align="center">
  Made with ❤️ by Nuru
</div>

[coverage_badge]: coverage_badge.svg
[coverage_link]: https://github.com/yourusername/countries-mobile-app/actions
[flutter_badge]: https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white
[flutter_link]: https://flutter.dev
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
