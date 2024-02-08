import 'package:e_commerce_app/Features/cart/domain/entities/order_entity.dart';
import 'package:e_commerce_app/Features/cart/domain/usecases/add_order_usecase.dart';
import 'package:e_commerce_app/core/Strings/failures.dart';
import 'package:e_commerce_app/core/Strings/messages.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'add_item_firestore_event.dart';
part 'add_item_firestore_state.dart';

@lazySingleton
class AddItemFirestoreBloc
    extends Bloc<AddItemFirestoreEvent, AddItemFirestoreState> {
  // final AddItemUsecase addItem;
  final AddOrderUseCase addOrder;
  AddItemFirestoreBloc({
    required this.addOrder,
    // required this.addItem,
  }) : super(
          const AddItemFirestoreState(
            status: AddItemFirestoreStatus.initial,
            message: "",
            itemsOrder: [],
          ),
        ) {
    on<AddItemFirestoreEvent>(
      (event, emit) async {
        if (event is AddOrderEvent) {
          emit(state.copyWith(status: AddItemFirestoreStatus.loading));
          final failureOrAdded = await addOrder(event.orderList);

          emit(
            failureOrAdded.fold(
              (failure) => state.copyWith(
                  status: AddItemFirestoreStatus.error,
                  message: _mapFailureToMessage(failure)),
              (_) => state.copyWith(
                status: AddItemFirestoreStatus.loaded,
                message: ADD_SUCCESS_MESSAGE,
              ),
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
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please try again later .";
    }
  }
}
