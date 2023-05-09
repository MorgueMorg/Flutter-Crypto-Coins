import 'dart:async';

import 'package:crypto_coins_array/crypto_coins_list_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio()),
  );

  // Handler for layout (flutterError method override for talker)
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  // Handler for bloc failure and others failure
  runZonedGuarded(
    () => runApp(const CryptoCurrenciesListApp()),
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
