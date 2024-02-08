import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first_list_view_model.g.dart';

@JsonSerializable()
class FirstListViewModel extends FirstListViewEntity {
  const FirstListViewModel({
    required super.title,
    required super.price,
    required super.id, required super.imageUrl,
  });
  factory FirstListViewModel.fromJson(Map<String, dynamic> json) =>
      _$FirstListViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirstListViewModelToJson(this);

  // factory FirstListViewModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
  //   return FirstListViewModel(
  //     title: documentSnapshot["title"],
  //     price: documentSnapshot['price'],
  //   );
  // }
}
