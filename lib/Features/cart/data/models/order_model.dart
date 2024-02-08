import 'package:e_commerce_app/Features/cart/data/models/item_model.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrderEntity {
  const OrderModel({required super.items, required super.id});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
