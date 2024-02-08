import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';

import 'package:injectable/injectable.dart';

part 'add_delete_item_event.dart';
part 'add_delete_item_state.dart';

@lazySingleton
class AddDeleteItemBloc extends Bloc<AddDeleteItemEvent, AddDeleteItemState> {
  List<ItemEntity> itemsList = [];
  int counter = 1;
  AddDeleteItemBloc()
      : super(
          const AddDeleteItemState(
            status: AddDeleteItemStatus.loaded,
            itemsList: [],
          ),
        ) {
    on<AddDeleteItemEvent>(
      (event, emit) {
        if (event is AddItemEvent) {
          emit(state.copyWith(status: AddDeleteItemStatus.loading));

          itemsList.add(event.item);

          emit(state.copyWith(
              status: AddDeleteItemStatus.loaded, itemsList: itemsList));
        } else if (event is DeleteItemEvent) {
          emit(state.copyWith(status: AddDeleteItemStatus.loading));
          itemsList.removeAt(event.itemId);
          emit(state.copyWith(
              status: AddDeleteItemStatus.loaded, itemsList: itemsList));
        }
        if (event is ItemsIncreamentEvent) {
          ++itemsList[event.itemId].counter;

          emit(state.copyWith(
              status: AddDeleteItemStatus.loaded, itemsList: itemsList));
        }
        if (event is ItemsDecreamentEvent) {
          --itemsList[event.itemId].counter;

          emit(state.copyWith(
              status: AddDeleteItemStatus.loaded, itemsList: itemsList));
        }
      },
    );
  }
}
