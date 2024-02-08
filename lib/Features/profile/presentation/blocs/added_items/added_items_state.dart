// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'added_items_bloc.dart';

enum AddedItemsStatus {
  initial,
  loading,
  error,
  loaded,
  imageChanged,
  genderChanged,
}

class AddedItemsState extends Equatable {
  final AddedItemsStatus status;
  final List<OrdersListEntity> orders;
  final String message;
  final List<UserEntity> user;
  final String image;
  final bool isMale;
  const AddedItemsState({
    required this.status,
    required this.orders,
    required this.message,
    required this.user,
    required this.image,
    required this.isMale,
  });

  AddedItemsState copyWith({
    AddedItemsStatus? status,
    List<OrdersListEntity>? orders,
    String? message,
    List<UserEntity>? user,
    String? image,
    bool?isMale
  }) {
    return AddedItemsState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      message: message ?? this.message,
      user: user ?? this.user,
      image: image ?? this.image,
      isMale: isMale ?? this.isMale,
    );
  }

  @override
  List<Object> get props => [status, orders, message, user, image,isMale];
}
