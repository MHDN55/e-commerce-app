import 'package:e_commerce_app/Features/profile/data/models/added_items_model.dart';
import 'package:e_commerce_app/Features/profile/domain/entities/order_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrdersListModel extends OrdersListEntity {
  const OrdersListModel({
    required super.id,
    required super.items,
    
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersListModelToJson(this);
}
