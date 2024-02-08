// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/get_third_list_view_usecase.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/update_favorite_use_case.dart';
import 'package:e_commerce_app/core/Strings/failures.dart';
import 'package:e_commerce_app/core/Strings/messages.dart';
import 'package:e_commerce_app/core/error/failures.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@lazySingleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  // final AddFevoriteUsecase addFevorite;
  // final GetFavoritesUseCase getFavorites;
  // final DeleteFevoriteUsecase deleteFevorite;
  final GetThirdListViewUseCase getThirdListView;
  final UpdateFevoriteUsecase updateFevorite;
  FavoriteBloc({
    required this.getThirdListView,
    required this.updateFevorite,
  }) : super(
          const FavoriteState(
            favoritesList: [],
            status: FavoriteStatus.initial,
            favorite: ThirdListViewEntity(
                title: "", price: "", id: 0, isFavorite: false),
            message: "",
          ),
        ) {
    on<FavoriteEvent>(
      (event, emit) async {
        // if (event is AddFavoriteEvent) {
        //   emit(state.copyWith(status: FavoriteStatus.loading));

        //   final addedOrNot = await addFevorite(event.favoritesList);

        //   emit(
        //     addedOrNot.fold(
        //       (failure) => state.copyWith(
        //         status: FavoriteStatus.error,
        //         message: _mapFailureToMessage(failure),
        //       ),
        //       (_) => state.copyWith(
        //         status: FavoriteStatus.loaded,
        //         message: ADD_ITEM_TO_FAVORITES_MESSAGE,
        //       ),
        //     ),
        //   );
        // } else if (event is DeleteFavoriteEvent) {
        //   emit(state.copyWith(status: FavoriteStatus.loading));

        //   final addedOrNot = await deleteFevorite(event.favoritesList);
        //   emit(
        //     addedOrNot.fold(
        //       (failure) => state.copyWith(
        //         status: FavoriteStatus.error,
        //         message: _mapFailureToMessage(failure),
        //       ),
        //       (_) => state.copyWith(
        //         status: FavoriteStatus.loaded,
        //         message: DELETE_SUCCESS_MESSAGE,
        //       ),
        //     ),
        //   );
        // } else
        if (event is UpdateFavoriteEvent) {
          emit(state.copyWith(status: FavoriteStatus.loading));

          final addedOrNot = await updateFevorite(event.favorite);
          emit(
            addedOrNot.fold(
              (failure) => state.copyWith(
                status: FavoriteStatus.error,
                message: _mapFailureToMessage(failure),
              ),
              (_) => state.copyWith(
                status: FavoriteStatus.changed,
                message: UPDATE_SUCCESS_MESSAGE,
              ),
            ),
          );
        }
        else if (event is GetFavoritesEvent) {
          emit(state.copyWith(status: FavoriteStatus.loading));

          final getOrNot = await getThirdListView();

          emit(
            getOrNot.fold(
              (failure) => state.copyWith(
                status: FavoriteStatus.error,
                message: _mapFailureToMessage(failure),
              ),
              (favorites) => state.copyWith(
                status: FavoriteStatus.changed,
                favoritesList: favorites,
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
      case EmptyCacheFailure _:
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please try again later .";
    }
  }
}
