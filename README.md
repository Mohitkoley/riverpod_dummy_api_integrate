# Riverpod API Integrate

A comprehensive Flutter application demonstrating best practices for API integration using Riverpod for state management, Dio for networking, and SQLite for local data persistence. This project fetches data from [JSONPlaceholder](https://jsonplaceholder.typicode.com/) and implements a robust architecture for handling data states with local storage capabilities.

## Features

- **Mock Authentication**: Mock login functionality with persistence using `shared_preferences`.
- **State Management**: Utilizes `flutter_riverpod` for efficient and reactive state management.
- **Networking**: Implements `dio` for handling HTTP requests with proper timeouts and interceptors.
- **Local Database**: SQLite integration with `sqflite` for persistent local storage.
- **Address Management**: Complete CRUD operations for address data with local persistence.
- **Architecture**: Follows a clean MVVM-style architecture separating logic into Views, ViewModels, Repositories, and Models.
- **Error Handling**: Robust error handling for network issues and database operations.
- **UI UX**:
  - Splash screen for auth initialization
  - Loading states
  - Error states with retry mechanism
  - Pull-to-refresh functionality
  - Clean and responsive UI using `google_fonts`
  - Address list, add, edit, and delete functionality
- **Code Generation**: Uses `json_serializable` for type-safe JSON parsing.

## Project Structure

```
lib/
├── core/               # Core functionality
│   ├── database/       # SQLite database helper
│   ├── network/        # Network configuration
│   ├── theme/          # App theming
│   └── router/         # Navigation routing
├── data/               # Data layer (Models)
├── repositories/       # Repository pattern implementation
├── viewmodels/         # State management (Providers)
├── views/              # UI layer (Pages, Widgets)
│   ├── address/        # Address management screens
│   └── widgets/        # Reusable UI components
└── main.dart           # Application entry point
```

## Dependencies

### Core Dependencies
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) - State management
- [dio](https://pub.dev/packages/dio) - HTTP client
- [sqflite](https://pub.dev/packages/sqflite) - SQLite database
- [path_provider](https://pub.dev/packages/path_provider) - File system paths
- [go_router](https://pub.dev/packages/go_router) - Navigation routing
- [shared_preferences](https://pub.dev/packages/shared_preferences) - Local key-value persistence

### UI & Utilities
- [google_fonts](https://pub.dev/packages/google_fonts) - Custom fonts
- [uuid](https://pub.dev/packages/uuid) - Unique ID generation
- [equatable](https://pub.dev/packages/equatable) - Value equality
- [json_annotation](https://pub.dev/packages/json_annotation) - JSON serialization

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

## Database Schema

The application uses SQLite for local address storage with the following schema:

```sql
CREATE TABLE addresses (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  street TEXT NOT NULL,
  city TEXT NOT NULL,
  zipCode TEXT NOT NULL,
  phoneNumber TEXT NOT NULL
);
```

## Key Features

### Mock Login
- **Splash Screen**: Checks authentication status on startup.
- **Mock Credentials**: 
  - **Email**: `abc@gmail.com`
  - **Password**: `12345`
- **Persistence**: Remembers login status using `shared_preferences`.
- **Automatic Redirection**: Protects routes based on authentication state.

### Address Management
- **List View**: Display all saved addresses with sorting by name
- **Add Address**: Create new addresses with form validation
- **Edit Address**: Update existing address information
- **Delete Address**: Remove addresses with confirmation
- **Persistent Storage**: All data is stored locally in SQLite database

### Database Operations
- **CRUD Operations**: Complete Create, Read, Update, Delete functionality
- **Error Handling**: Proper error states for database operations
- **Async Operations**: All database operations are asynchronous with loading states
- **Data Validation**: Form validation for all address fields

## Development

### Code Quality
- **Formatting**: The project follows standard Dart formatting. Run `dart format .` before committing.
- **Linting**: Uses `flutter_lints` for code quality.
- **Analysis**: Run `flutter analyze` to check for issues.

### Database Development
- Database helper follows singleton pattern for thread safety
- All database operations are wrapped in try-catch blocks
- Proper resource management with database closing
- Type-safe database operations with model mapping

## Architecture Patterns

### Repository Pattern
- Clean separation between data sources and business logic
- Abstracts database operations behind repository interface
- Easy to switch between different data sources

### State Management
- Riverpod providers for reactive state management
- Separate providers for different data concerns
- Async state handling with loading and error states

### MVVM Architecture
- Views (UI) observe state from providers
- ViewModels (Providers) handle business logic
- Models represent data structures
- Repositories handle data access
