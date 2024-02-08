// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_list_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondListViewModel _$SecondListViewModelFromJson(Map<String, dynamic> json) =>
    SecondListViewModel(
      title: json['title'] as String,
      priceAfter: json['priceAfter'] as String,
      priceBefore: json['priceBefore'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$SecondListViewModelToJson(
        SecondListViewModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'priceAfter': instance.priceAfter,
      'priceBefore': instance.priceBefore,
      'id': instance.id,
    };
