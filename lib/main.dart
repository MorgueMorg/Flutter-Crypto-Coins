import 'dart:async';

import 'package:crypto_coins_array/crypto_coins_list_app.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'firebase_options.dart';
import 'repositories/crypto_coins/crypto_coins.dart';

void main() async {
  // Cause of firebase docs---------------------
  WidgetsFlutterBinding.ensureInitialized();
  // -------------------------------------------
  // Initializing talker
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  // Talker for debug mode
  GetIt.I<Talker>().debug('Talker started...');

  // Firebase init
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.info(app.options.projectId);

  // Added dio interceptor for talker
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  // Added bloc observer for talker
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
        printStateFullData: false, printEventFullData: false),
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio),
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
