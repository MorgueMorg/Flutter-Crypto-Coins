import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
    required this.lastMarket,
  });

  // TOSYMBOL
  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  // LASTUPDATE
  @HiveField(1)
  @JsonKey(
      name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;

  // HIGH24HOUR
  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  // LOW24HOUR
  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  // LASTMARKET
  @HiveField(4)
  @JsonKey(name: 'LASTMARKET')
  final String lastMarket;

  @HiveField(5)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(6)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  // For json serializable (code generation)
  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object> get props => [
        toSymbol,
        lastUpdate,
        hight24Hour,
        low24Hours,
        lastMarket,
        priceInUSD,
        imageUrl,
      ];
}
