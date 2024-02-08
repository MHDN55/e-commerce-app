// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'added_items_bloc.dart';

class AddedItemsEvent extends Equatable {
  const AddedItemsEvent();

  @override
  List<Object> get props => [];
}

class GetAddedItemsEvent extends AddedItemsEvent {}

class GetAddedOrdersEvent extends AddedItemsEvent {}

class GetUserEvent extends AddedItemsEvent {}

class AddProfileImageEvent extends AddedItemsEvent {
  final File file;
  final String image;
  const AddProfileImageEvent({
    required this.file,
    required this.image,
  });

  @override
  List<Object> get props => [file, image];
}

class ChangingPicEvent extends AddedItemsEvent {
  final bool isMale;
  const ChangingPicEvent({
    required this.isMale,
  });

  @override
  List<Object> get props => [isMale];
}
