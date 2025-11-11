# 🌍 Countries Mobile App

[![coverage][coverage_badge]][coverage_link]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Flutter][flutter_badge]][flutter_link]

A beautiful, feature-rich Flutter application for exploring countries around the world. Built with modern Flutter practices and clean architecture.


## 📱 App Demo

https://github.com/user-attachments/assets/0f13ea29-7084-416b-be42-ec830c6a5d8c

> *Note: If the video doesn't load, you can view it directly in the [assets folder](assets/Country%20App.mov)*


## ✨ Features

- 🌎 Browse all countries with key information
- � Search for specific countries
- ⭐ Mark countries as favorites for quick access
- 🌓 Light & Dark theme support
- 📱 Responsive design for all screen sizes
- 🚀 Bloc state management
- 🌐 Internationalization support settings

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.35.0 or higher)
- Dart SDK (3.9.0 or higher)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio with Flutter plugins

### Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/countries-mobile-app.git
   cd countries-mobile-app
   ```

2. **Set up environment variables**
   
   Create a `.env` file in the root directory:
   ```sh
   touch .env
   ```
   
   Add the following content to `.env`:
   ```env
   # API Configuration
   BASE_URL=https://restcountries.com/v3.1
   ```
   
   **Note:** The `.env` file is already included in `.gitignore` to keep sensitive data secure.

3. **Install dependencies**
   ```sh
   flutter pub get
   ```

4. **Run the app**
   ```sh
   # For development
   flutter run --flavor development --target lib/main_development.dart
   
   # For staging
   flutter run --flavor staging --target lib/main_staging.dart
   
   # For production
   flutter run --flavor production --target lib/main_production.dart
   ```

### Environment Variables

The app uses environment variables to manage configuration across different environments:

| Variable | Description | Required | Default |
|----------|-------------|----------|----------|
| `BASE_URL` | REST Countries API base URL | Yes | `https://restcountries.com/v3.1` |

These variables are loaded using the `flutter_dotenv` package and accessed throughout the app.

### Project Structure

```
lib/
├── app/
│   ├── Business Logic/          # State Management
│   │   ├── CountrySummary/      # Country list BLoC
│   │   ├── FavoritesCountry/    # Favorites management BLoC
│   │   └── Theme/               # Theme management BLoC
│   ├── Data Layer/              # Data Management
│   │   ├── Models/              # Data models (Country, Details)
│   │   └── Repository/          # API service & repository
│   ├── UI/                      # User Interface
│   │   ├── Screens/             # App screens (Home, Detail, Splash)
│   │   ├── Widgets/             # Reusable widgets
│   │   └── Utils/               # UI helpers, constants, themes
│   └── view/                    # App root widget
├── l10n/                        # Localization files
├── bootstrap.dart               # App initialization
├── main_development.dart        # Development entry point
├── main_staging.dart            # Staging entry point
└── main_production.dart         # Production entry point
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
- [HTTP](https://pub.dev/packages/http) - HTTP client for API calls
- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Local storage for favorites
- [Flutter Localizations](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) - Internationalization support
- [Flutter DotEnv](https://pub.dev/packages/flutter_dotenv) - Environment variable management
- [Shimmer](https://pub.dev/packages/shimmer) - Loading shimmer effect
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis) - Linting rules

## 🏗️ Architecture & Technology Choices

### Clean Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────────────┐
│           Presentation Layer                │
│  (UI Screens, Widgets, BLoC Builders)       │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│          Business Logic Layer               │
│     (BLoCs, Events, States, Use Cases)      │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│            Data Layer                       │
│  (Repositories, API Services, Models)       │
└─────────────────────────────────────────────┘
```

### State Management: BLoC Pattern

**Why BLoC?**

1. **Separation of Concerns**: Business logic is completely separated from UI
2. **Testability**: Easy to write unit tests for business logic
3. **Predictability**: State changes are explicit and traceable
4. **Scalability**: Works well for large applications
5. **Reactive**: Stream-based architecture for reactive programming

**BLoCs in this app:**
- `CountrySummaryBloc`: Manages country list, search, and refresh
- `FavoritesCountryBloc`: Handles favorite countries (persisted locally)
- `ThemeBloc`: Manages light/dark theme switching

### Data Management

**Repository Pattern**: Abstracts data sources from business logic
- `CountriesRepository`: Provides clean API for country data
- `CountriesApiService`: Handles HTTP requests to REST Countries API

**Local Storage**: Uses `SharedPreferences` for:
- Favorite countries persistence
- Theme preference storage

### UI/UX Features

1. **Splash Screen**: Animated splash with smooth transition
2. **Shimmer Loading**: Beautiful loading states
3. **Pull-to-Refresh**: Intuitive data refresh mechanism
4. **Scrollbar**: Visible scrollbar for better navigation
5. **Search**: Real-time country search with debouncing
6. **Theme Support**: Light and dark mode
7. **Responsive Design**: Adapts to different screen sizes

### Build Flavors

The app supports three build flavors:
- **Development**: For active development with debug features
- **Staging**: For testing in a production-like environment
- **Production**: For release builds

Each flavor has:
- Separate entry point (`main_*.dart`)
- Different app identifiers
- Custom app names with prefixes ([DEV], [STG])

### Code Quality

- **Very Good Analysis**: Strict linting rules for code quality
- **Type Safety**: Strong typing throughout the codebase
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Documentation**: Well-documented code with clear comments

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
  Made with ❤️ by Nuru Abimana
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
