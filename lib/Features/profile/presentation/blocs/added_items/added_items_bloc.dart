import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/profile/domain/entities/order_list_entity.dart';
import 'package:e_commerce_app/Features/profile/domain/usecases/add_profile_image.dart';
import 'package:e_commerce_app/Features/profile/domain/usecases/get_orders_list.dart';
import 'package:e_commerce_app/Features/profile/domain/usecases/get_user.dart';
import 'package:e_commerce_app/core/Strings/failures.dart';
import 'package:e_commerce_app/core/error/failures.dart';

part 'added_items_event.dart';
part 'added_items_state.dart';

@lazySingleton
class AddedItemsBloc extends Bloc<AddedItemsEvent, AddedItemsState> {
  // final GetAddedItemsUsecase getAddedItems;
  final GetAddedOrdersUsecase getAddedOrders;
  final GetUserUsecase getUser;
  final AddProfileImageUsecase addImage;
  AddedItemsBloc({
    required this.getAddedOrders,
    required this.getUser,
    required this.addImage,
  }) : super(
          const AddedItemsState(
            status: AddedItemsStatus.initial,
            orders: [],
            message: "",
            user: [],
            image: '',
            isMale: true,
          ),
        ) {
    on<AddedItemsEvent>(
      (event, emit) async {
        // if (event is GetAddedItemsEvent) {
        //   emit(state.copyWith(status: AddedItemsStatus.loading));
        //   final failureOrCategories = await getAddedItems();
        //   emit(
        //     failureOrCategories.fold(
        //       (failure) => state.copyWith(
        //           status: AddedItemsStatus.error,
        //           message: _mapFailureToMessage(failure)),
        //       (addedItems) => state.copyWith(
        //           status: AddedItemsStatus.loaded, items: addedItems),
        //     ),
        //   );
        // }
        if (event is GetAddedOrdersEvent) {
          emit(state.copyWith(status: AddedItemsStatus.loading));
          final failureOrCategories = await getAddedOrders();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  status: AddedItemsStatus.error,
                  message: _mapFailureToMessage(failure)),
              (addedOrders) => state.copyWith(
                  status: AddedItemsStatus.loaded, orders: addedOrders),
            ),
          );
        } else if (event is GetUserEvent) {
          emit(state.copyWith(status: AddedItemsStatus.loading));
          final failureOrCategories = await getUser();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  status: AddedItemsStatus.error,
                  message: _mapFailureToMessage(failure)),
              (user) =>
                  state.copyWith(status: AddedItemsStatus.loaded, user: user),
            ),
          );
        } else if (event is AddProfileImageEvent) {
          emit(state.copyWith(status: AddedItemsStatus.loading));
          final failureOrCategories = await addImage(event.file, event.image);
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  status: AddedItemsStatus.error,
                  message: _mapFailureToMessage(failure)),
              (image) =>
                  state.copyWith(status: AddedItemsStatus.loaded, image: image),
            ),
          );
        } else if (event is ChangingPicEvent) {
          emit(
            state.copyWith(
              status: AddedItemsStatus.genderChanged,
              isMale: event.isMale,
            ),
          );
        }
      },
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure _:
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please try again later .";
    }
  }
}
