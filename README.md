# Riverpod API Integrate

A comprehensive Flutter application demonstrating best practices for API integration using Riverpod for state management and Dio for networking. This project fetches data from [JSONPlaceholder](https://jsonplaceholder.typicode.com/) and implements a robust architecture for handling data states.

## Features

- **State Management**: Utilizes `flutter_riverpod` for efficient and reactive state management.
- **Networking**: Implements `dio` for handling HTTP requests with proper timeouts and interceptors.
- **Architecture**: Follows a clean MVVM-style architecture separating logic into Views, ViewModels, Repositories, and Models.
- **Error Handling**: Robust error handling for network issues and data fetching failures.
- **UI UX**:
  - Loading states
  - Error states with retry mechanism
  - Pull-to-refresh functionality
  - Clean and responsive UI using `google_fonts`
- **Code Generation**: Uses `json_serializable` for type-safe JSON parsing.

## Project Structure

```
lib/
├── core/               # Core functionality (Network, Theme, etc.)
├── data/               # Data layer (Models)
├── repositories/       # Repository pattern implementation
├── viewmodels/         # State management (Providers)
├── views/              # UI layer (Pages, Widgets)
└── main.dart           # Application entry point
```

## Dependencies

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [dio](https://pub.dev/packages/dio)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [equatable](https://pub.dev/packages/equatable)
- [google_fonts](https://pub.dev/packages/google_fonts)

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd riverpod_api_integrate
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run code generation (if you modify models):
   ```bash
   dart run build_runner build
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Development

- **Formatting**: The project follows standard Dart formatting. Run `dart format .` before committing.
- **Linting**: Uses `flutter_lints` for code quality.
