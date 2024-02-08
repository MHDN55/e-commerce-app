// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_list_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstListViewModel _$FirstListViewModelFromJson(Map<String, dynamic> json) =>
    FirstListViewModel(
      title: json['title'] as String,
      price: json['price'] as String,
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$FirstListViewModelToJson(FirstListViewModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
    };
