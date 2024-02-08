// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/Features/cart/data/models/item_model.dart';
import 'package:equatable/equatable.dart';


class OrderEntity extends Equatable {
  final List<ItemModel> items;
  final int id;
  const OrderEntity({
    required this.items,
    required this.id,
  });
  @override
  List<Object?> get props => [items, id];
}
