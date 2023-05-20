import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  CryptoCoinsRepository({required this.cryptoCoinsBox, required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFromApi();
      // Перевожу в мапу (Словарь) циклом, где у каждого ключа (e.name) будет значение e
      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      // Метод putAll(Hive method)
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);
      return cryptoCoinsBox.values.toList();
    }

    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
    // Сериализация
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD");
    final data = response.data as Map<String, dynamic>;
    // Достаю из верхней даты
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    // Достаю из верхней dateRaw
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      // Достаю по usdData
      final details = CryptoCoinDetail.fromJson(usdData);

      return CryptoCoin(
        name: e.key,
        details: details,
      );
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);

    return CryptoCoin(
      name: currencyCode,
      details: details,
    );
  }
}
