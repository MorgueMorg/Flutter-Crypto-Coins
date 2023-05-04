import 'package:flutter/material.dart';
import 'package:crypto_coins_array/router/router.dart';
import 'package:crypto_coins_array/theme/theme.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesArray',
      theme: darkTheme,
      routes: routes,
    );
  }
}
