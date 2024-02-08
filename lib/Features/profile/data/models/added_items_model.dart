import 'package:e_commerce_app/Features/profile/domain/entities/added_items_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'added_items_model.g.dart';

@JsonSerializable()
class AddedItemsModel extends AddedItemsEntity {
  const AddedItemsModel({
    required super.title,
    required super.subtitle,
    required super.id,
    required super.counter,
  });
  factory AddedItemsModel.fromJson(Map<String, dynamic> json) =>
      _$AddedItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddedItemsModelToJson(this);
}
