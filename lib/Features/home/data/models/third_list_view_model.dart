import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'third_list_view_model.g.dart';

@JsonSerializable()
class ThirdListViewModel extends ThirdListViewEntity {
  const ThirdListViewModel({
    required super.title,
    required super.price,
    required super.id,
    required super.isFavorite,
  });
  factory ThirdListViewModel.fromJson(Map<String, dynamic> json) =>
      _$ThirdListViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThirdListViewModelToJson(this);
}
