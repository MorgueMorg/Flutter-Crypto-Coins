import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

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
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  // LASTUPDATE
  @JsonKey(
      name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;

  // HIGH24HOUR
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  // LOW24HOUR
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  // LASTMARKET
  @JsonKey(name: 'LASTMARKET')
  final String lastMarket;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

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
