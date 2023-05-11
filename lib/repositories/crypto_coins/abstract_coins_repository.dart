import 'package:crypto_coins_array/repositories/models/crypto_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
}
