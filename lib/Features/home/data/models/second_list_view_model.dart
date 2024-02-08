// ignore_for_file: non_constant_identifier_names

import 'package:e_commerce_app/Features/home/domain/entities/second_list_view_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'second_list_view_model.g.dart';

@JsonSerializable()
class SecondListViewModel extends SecondListViewEntity {
  const SecondListViewModel({
    required super.title,
    required super.priceAfter,
    required super.priceBefore, required super.id,
  });
  factory SecondListViewModel.fromJson(Map<String, dynamic> json) =>
      _$SecondListViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecondListViewModelToJson(this);

  // factory SecondListViewModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
  //   return SecondListViewModel(
  //     title: documentSnapshot["title"],
  //     price_after: documentSnapshot["price_after"],
  //     price_before: documentSnapshot["price_before"],
  //   );
  // }
}
