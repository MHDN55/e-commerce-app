// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_item_firestore_bloc.dart';

enum AddItemFirestoreStatus { initial, loading, error, loaded }

class AddItemFirestoreState extends Equatable {
  final AddItemFirestoreStatus status;
  final String message;
  final List<OrderEntity> itemsOrder;
  const AddItemFirestoreState({
    required this.status,
    required this.message,
    required this.itemsOrder,
  });

  AddItemFirestoreState copyWith({
    AddItemFirestoreStatus? status,
    String? message,
    List<OrderEntity>? itemsOrder,
  }) {
    return AddItemFirestoreState(
      status: status ?? this.status,
      message: message ?? this.message,
      itemsOrder: itemsOrder ?? this.itemsOrder,
    );
  }

  @override
  List<Object> get props => [status, message, itemsOrder];
}

// final class AddItemFirestoreInitial extends AddItemFirestoreState {}
