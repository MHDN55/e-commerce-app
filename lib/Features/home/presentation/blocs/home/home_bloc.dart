// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/home/domain/entities/app_bar_category_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/second_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/get_all_categories.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/get_first_list_view_usecase.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/get_second_list_view_usecase.dart.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/get_third_list_view_usecase.dart';
import 'package:e_commerce_app/Features/home/domain/usecases/update_favorite_use_case.dart';
import 'package:e_commerce_app/core/Strings/failures.dart';
import 'package:e_commerce_app/core/error/failures.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCategoriesUseCase getCategories;
  final GetFirstListViewUseCase getFirstListView;
  final GetSecondListViewUseCase getSecondListView;
  final GetThirdListViewUseCase getThirdListView;
  final UpdateFevoriteUsecase updateFevorite;
  HomeBloc({
    required this.getCategories,
    required this.getFirstListView,
    required this.getSecondListView,
    required this.getThirdListView,
    required this.updateFevorite,
  }) : super(
          const HomeState(
            statusCategory: HomeStatus.initial,
            statusFirstListView: HomeStatus.initial,
            statusSecondListView: HomeStatus.initial,
            statusThirdListView: HomeStatus.initial,
            statusText: HomeStatus.initial,
            statusFavorite: HomeStatus.initial,
            category: [],
            firstListView: [],
            secondListView: [],
            thirdListView: [],
            message: "",
            position: 0,
          ),
        ) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is GetCategoriesEvent) {
          emit(state.copyWith(statusCategory: HomeStatus.loading));

          final failureOrCategories = await getCategories();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  statusCategory: HomeStatus.error,
                  message: _mapFailureToMessage(failure)),
              (category) => state.copyWith(
                  statusCategory: HomeStatus.loaded, category: category),
            ),
          );
        } else if (event is GetFirstListViewEvent) {
          emit(state.copyWith(statusFirstListView: HomeStatus.loading));

          final failureOrCategories = await getFirstListView();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  statusFirstListView: HomeStatus.error,
                  message: _mapFailureToMessage(failure)),
              (firstListView) => state.copyWith(
                  statusFirstListView: HomeStatus.loaded,
                  firstListView: firstListView),
            ),
          );
        } else if (event is GetSecondListViewEvent) {
          emit(state.copyWith(statusSecondListView: HomeStatus.loading));

          final failureOrCategories = await getSecondListView();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  statusSecondListView: HomeStatus.error,
                  message: _mapFailureToMessage(failure)),
              (secondListView) => state.copyWith(
                  statusSecondListView: HomeStatus.loaded,
                  secondListView: secondListView),
            ),
          );
        } else if (event is GetThirdListViewEvent) {
          emit(state.copyWith(statusThirdListView: HomeStatus.loading));

          final failureOrCategories = await getThirdListView();
          emit(
            failureOrCategories.fold(
              (failure) => state.copyWith(
                  statusThirdListView: HomeStatus.error,
                  message: _mapFailureToMessage(failure)),
              (thirdListView) => state.copyWith(
                  statusThirdListView: HomeStatus.loaded,
                  thirdListView: thirdListView),
            ),
          );
        } else if (event is ScrollEvent) {
          emit(
            state.copyWith(
              statusText: HomeStatus.changedText,
              position: event.position,
            ),
          );
        }
        // else if (event is UpdateFavoriteEvent) {
        //   emit(state.copyWith(statusFavorite: HomeStatus.loading));

        //   final addedOrNot = await updateFevorite(event.favorite);
        //   emit(
        //     addedOrNot.fold(
        //       (failure) => state.copyWith(
        //         statusFavorite: HomeStatus.error,
        //         message: _mapFailureToMessage(failure),
        //       ),
        //       (_) => state.copyWith(
        //         statusFavorite: HomeStatus.loaded,
        //         message: UPDATE_SUCCESS_MESSAGE,
        //       ),
        //     ),
        //   );
        // }
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
