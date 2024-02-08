// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/Features/profile/data/models/added_items_model.dart';

class OrdersListEntity extends Equatable {
  final int id;
  final List<AddedItemsModel> items;

  const OrdersListEntity({
    required this.items,
    required this.id,
  });

  @override
  List<Object?> get props => [items, id];
}
