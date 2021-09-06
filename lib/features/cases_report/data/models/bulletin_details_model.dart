import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/bulletin_details.dart';
import '../../domain/entities/bulletin.dart';

part 'bulletin_details_model.g.dart';

/// Modelo que executa a conversão do `JSON` para Objeto.
///
/// Contém informações adicionais da consulta e a lista de [BulletinDetails].
@JsonSerializable(createToJson: false)
class BulletinDetailsEnvelope {
  final int? count;
  final String? next;
  final String? previous;
  @JsonKey(name: 'results')
  final List<BulletinDetailsModel>? bulletins;

  const BulletinDetailsEnvelope(
      this.count, this.next, this.previous, this.bulletins);

  factory BulletinDetailsEnvelope.fromJson(Map<String, dynamic> json) =>
      _$BulletinDetailsEnvelopeFromJson(json);
}

/// Modelo que executa a conversão do `JSON` para Objeto.
@JsonSerializable(createToJson: false)
class BulletinDetailsModel extends BulletinDetails {
  const BulletinDetailsModel({
    DateTime? date,
    String? state,
    String? city,
    PlaceType? placeType,
    int? confirmed,
    int? deaths,
    bool? isLast,
    int? estimatedPopulation,
    int? estimatedPopulation2019,
    String? cityIbgeCode,
    double? confirmedPer100kInhabitants,
    double? deathRate,
    int? orderForPlace,
  }) : super(
          date,
          state,
          city,
          placeType,
          confirmed,
          deaths,
          isLast,
          estimatedPopulation,
          estimatedPopulation2019,
          cityIbgeCode,
          confirmedPer100kInhabitants,
          deathRate,
          orderForPlace,
        );

  factory BulletinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BulletinDetailsModelFromJson(json);
}
