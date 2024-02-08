// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersListModel _$OrdersListModelFromJson(Map<String, dynamic> json) =>
    OrdersListModel(
      id: json['id'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => AddedItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersListModelToJson(OrdersListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
    };
