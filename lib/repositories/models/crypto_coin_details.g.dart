// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetail(
      priceInUSD: fields[5] as double,
      imageUrl: fields[6] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[1] as DateTime,
      hight24Hour: fields[2] as double,
      low24Hours: fields[3] as double,
      lastMarket: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.lastUpdate)
      ..writeByte(2)
      ..write(obj.hight24Hour)
      ..writeByte(3)
      ..write(obj.low24Hours)
      ..writeByte(4)
      ..write(obj.lastMarket)
      ..writeByte(5)
      ..write(obj.priceInUSD)
      ..writeByte(6)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetail._dateTimeFromJson(json['LASTUPDATE'] as int),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
      lastMarket: json['LASTMARKET'] as String,
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CryptoCoinDetail._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.hight24Hour,
      'LOW24HOUR': instance.low24Hours,
      'LASTMARKET': instance.lastMarket,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
    };
