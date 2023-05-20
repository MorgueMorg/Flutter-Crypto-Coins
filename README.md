<h1 align="center"> Flutter Crypto Currency List </h1>

<p align="center"> A simple flutter crypto application that parses data from the api site https://min-api.cryptocompare.com/documentation. Can log errors and events, can work without network using local database Hive. </p>

<h2 align="center"> Priview </h2>

| ![screen1](/assets/results/crypto_list_screen.png) | ![screen2](/assets/results/crypto_coin_screen.png) | ![screen3](/assets/results/talker_screen.png) |
| :------------: | :------------: | :------------: |

<h2 align="center"> Features </h2>

1. Uses [bloc](https://pub.dev/packages/flutter_bloc) as state management
2. Uses [dio](https://pub.dev/packages/dio) for work with http
3. Uses [get_it](https://pub.dev/packages/get_it) for dependency injection
4. Uses [equatable](https://pub.dev/packages/equatable) for value/states equality
5. Uses [talker_flutter](https://pub.dev/packages/talker_flutter) for logging application
6. Uses [firebase_core](https://pub.dev/packages/firebase_core) for work with firebase
7. Uses [json_annotation](https://pub.dev/packages/json_annotation) for JSON serialization and deserialization.
8. Uses [hive_flutter](https://pub.dev/packages/hive) for work with hive local database
9. Uses [auto_route](https://pub.dev/packages/auto_route) for work with auto routes

<h2 align="center"> How to run </h2>

1. Clone the repo
   ```sh
   git@github.com:MorgueMorg/Flutter-Crypto-Coins.git
   ```
   or
   ```sh
   https://github.com/MorgueMorg/Flutter-Crypto-Coins.git
   ```
   
2. Install all the packages by typing
   ```sh
   flutter pub get
   ```
   
3. Run the App
   ```sh
   flutter run
   ```

<h2 align="center"> Info </h2>

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
