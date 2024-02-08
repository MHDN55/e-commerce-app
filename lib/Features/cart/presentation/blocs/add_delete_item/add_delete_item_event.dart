// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_delete_item_bloc.dart';

sealed class AddDeleteItemEvent extends Equatable {
  const AddDeleteItemEvent();

  @override
  List<Object> get props => [];
}

class AddItemEvent extends AddDeleteItemEvent {
  final ItemEntity item;
  const AddItemEvent({
    required this.item,
  });
  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends AddDeleteItemEvent {
  final int itemId;
  const DeleteItemEvent({
    required this.itemId,
  });
  @override
  List<Object> get props => [itemId];
}

class ItemsIncreamentEvent extends AddDeleteItemEvent {
  final int itemId;
  const ItemsIncreamentEvent({
    required this.itemId,
  });
  @override
  List<Object> get props => [itemId];
}

class ItemsDecreamentEvent extends AddDeleteItemEvent {
  final int itemId;
  const ItemsDecreamentEvent({
    required this.itemId,
  });
  @override
  List<Object> get props => [itemId];
}

