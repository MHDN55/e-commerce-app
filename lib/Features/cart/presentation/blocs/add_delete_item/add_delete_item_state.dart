// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_delete_item_bloc.dart';

enum AddDeleteItemStatus { initial, loading, error, loaded }

class AddDeleteItemState extends Equatable {
  final AddDeleteItemStatus status;
  final List<ItemEntity> itemsList;
  const AddDeleteItemState({
    required this.status,
    required this.itemsList,
  });

  AddDeleteItemState copyWith({
    AddDeleteItemStatus? status,
    List<ItemEntity>? itemsList,

  }) {
    return AddDeleteItemState(
      status: status ?? this.status,
      itemsList: itemsList ?? this.itemsList,
    );
  }

  @override
  List<Object> get props => [status, itemsList];
}

