import 'package:crypto_coins_array/feautures/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_array/feautures/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => CryptoListScreen(),
  '/coin': (context) => CryptoCoinScreen(),
};
