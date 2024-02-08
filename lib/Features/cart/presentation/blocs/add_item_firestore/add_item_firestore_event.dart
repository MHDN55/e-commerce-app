// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_item_firestore_bloc.dart';

class AddItemFirestoreEvent extends Equatable {
  const AddItemFirestoreEvent();

  @override
  List<Object> get props => [];
}

// class AddItemEvent extends AddItemFirestoreEvent {
//   final List<ItemEntity> items;
//   const AddItemEvent({
//     required this.items,
//   });
//   @override
//   List<Object> get props => [items];
// }

class AddOrderEvent extends AddItemFirestoreEvent {
  final List<ItemEntity> orderList;
  const AddOrderEvent({
    required this.orderList,
  });
  @override
  List<Object> get props => [orderList];
}
