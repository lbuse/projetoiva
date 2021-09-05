import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/bulletin.dart';

part 'bulletin_model.g.dart';

@JsonSerializable(createToJson: false)
class BulletinEnvelope {
  final int count;
  final String next;
  final String previous;
  @JsonKey(name: 'results')
  final List<BulletinModel> bulletins;

  BulletinEnvelope(this.count, this.next, this.previous, this.bulletins);

  factory BulletinEnvelope.fromJson(Map<String, dynamic> json) =>
      _$BulletinEnvelopeFromJson(json);
}

@JsonSerializable(createToJson: false)
class BulletinModel extends Bulletin {
  BulletinModel({
    DateTime date,
    String state,
    String city,
    PlaceType placeType,
    int confirmed,
    int deaths,
    bool isLast,
    int estimatedPopulation,
    int estimatedPopulation2019,
    String cityIbgeCode,
    double confirmedPer100kInhabitants,
    double deathRate,
    int orderForPlace,
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

  factory BulletinModel.fromJson(Map<String, dynamic> json) =>
      _$BulletinModelFromJson(json);
}
