import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/uf.dart';

part 'uf_model.g.dart';

@JsonSerializable(createToJson: false)
class UfModel extends Uf {
  UfModel({
    int? id,
    String? nome,
    String? sigla,
  }) : super(
          id: id,
          nome: nome,
          sigla: sigla,
        );

  factory UfModel.fromJson(Map<String, dynamic> json) =>
      _$UfModelFromJson(json);
}
