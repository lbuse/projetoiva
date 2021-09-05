import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/city.dart';

part 'city_model.g.dart';

@JsonSerializable(createToJson: false)
class CityModel extends City {
  CityModel({
    int id,
    String nome,
  }) : super(id: id, nome: nome);

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
