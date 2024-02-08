// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedItemsModel _$AddedItemsModelFromJson(Map<String, dynamic> json) =>
    AddedItemsModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      id: json['id'] as int,
      counter: json['counter'] as int,
    );

Map<String, dynamic> _$AddedItemsModelToJson(AddedItemsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'id': instance.id,
      'counter': instance.counter,
    };
