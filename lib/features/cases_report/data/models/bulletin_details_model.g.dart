// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulletinDetailsEnvelope _$BulletinDetailsEnvelopeFromJson(
        Map<String, dynamic> json) =>
    BulletinDetailsEnvelope(
      json['count'] as int?,
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => BulletinDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BulletinDetailsModel _$BulletinDetailsModelFromJson(
        Map<String, dynamic> json) =>
    BulletinDetailsModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      state: json['state'] as String?,
      city: json['city'] as String?,
      placeType: Bulletin.stringToPlaceType(json['place_type'] as String?),
      confirmed: json['confirmed'] as int?,
      deaths: json['deaths'] as int?,
      isLast: json['is_last'] as bool?,
      estimatedPopulation: json['estimated_population'] as int?,
      estimatedPopulation2019: json['estimated_population_2019'] as int?,
      cityIbgeCode: json['city_ibge_code'] as String?,
      confirmedPer100kInhabitants:
          (json['confirmed_per_100k_inhabitants'] as num?)?.toDouble(),
      deathRate: (json['death_rate'] as num?)?.toDouble(),
      orderForPlace: json['order_for_place'] as int?,
    );
