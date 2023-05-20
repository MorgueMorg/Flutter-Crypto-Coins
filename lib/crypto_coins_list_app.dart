import 'package:flutter/material.dart';
import 'package:crypto_coins_array/router/router.dart';
import 'package:crypto_coins_array/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  State<CryptoCurrenciesListApp> createState() =>
      _CryptoCurrenciesListAppState();
}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp> {
  // Initialize autorouter
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurrenciesArray',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        // ? Added talker for handling navigation
        navigatorObservers: () => [
          TalkerRouteObserver(
            GetIt.I<Talker>(),
          ),
        ],
      ),
      // routes: routes,
    );
  }
}
