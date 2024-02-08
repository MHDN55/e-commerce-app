// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';


@JsonSerializable()
class ItemModel extends ItemEntity {
   ItemModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.counter,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
