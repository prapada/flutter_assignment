# Flutter Assignment

A Flutter app for browsing products in a Product Catalog style. It fetches data from the DummyJSON API and displays it across product list, search, and product detail screens.

## Main Features

- Display a product list on the home screen
- Load more products using infinite scroll
- Refresh data with pull-to-refresh
- Search products in real time
- View detailed product information with images and extra details
- Use state management with Flutter Bloc

## Technologies Used

- Flutter
- Dart
- flutter_bloc
- dio
- cached_network_image
- equatable

## Project Structure

- lib/app: Main app setup
- lib/core: Shared project components such as dependency injection and networking
- lib/features/product: Product feature separated into bloc, data, domain, and presentation layers

## How to Run

1. Install the Flutter SDK and verify it is working:
   ```bash
   flutter --version
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Note

This app uses the DummyJSON API to simulate a real-world application that loads data from the network and renders dynamic content.
