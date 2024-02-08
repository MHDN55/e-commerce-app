// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_list_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdListViewModel _$ThirdListViewModelFromJson(Map<String, dynamic> json) =>
    ThirdListViewModel(
      title: json['title'] as String,
      price: json['price'] as String,
      id: json['id'] as int,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$ThirdListViewModelToJson(ThirdListViewModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'id': instance.id,
      'isFavorite': instance.isFavorite,
    };
