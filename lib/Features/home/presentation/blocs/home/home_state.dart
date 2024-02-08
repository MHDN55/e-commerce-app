// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  error,
  loaded,
  changedText,
  changedFavorite,
}

class HomeState extends Equatable {
  final HomeStatus statusCategory;
  final HomeStatus statusFirstListView;
  final HomeStatus statusSecondListView;
  final HomeStatus statusThirdListView;
  final HomeStatus statusText;
  final HomeStatus statusFavorite;
  final List<CategoryEntity> category;
  final List<FirstListViewEntity> firstListView;
  final List<SecondListViewEntity> secondListView;
  final List<ThirdListViewEntity> thirdListView;
  final String message;
  final int position;
  const HomeState({
    required this.statusCategory,
    required this.statusFirstListView,
    required this.statusSecondListView,
    required this.statusThirdListView,
    required this.statusText,
    required this.statusFavorite,
    required this.category,
    required this.firstListView,
    required this.secondListView,
    required this.thirdListView,
    required this.message,
    required this.position,
  });

  HomeState copyWith({
    HomeStatus? statusCategory,
    HomeStatus? statusFirstListView,
    HomeStatus? statusSecondListView,
    HomeStatus? statusThirdListView,
    HomeStatus? statusText,
    HomeStatus? statusFavorite,
    List<CategoryEntity>? category,
    List<FirstListViewEntity>? firstListView,
    List<SecondListViewEntity>? secondListView,
    List<ThirdListViewEntity>? thirdListView,
    String? message,
    int? position,
  }) {
    return HomeState(
      statusCategory: statusCategory ?? this.statusCategory,
      statusFirstListView: statusFirstListView ?? this.statusFirstListView,
      statusSecondListView: statusSecondListView ?? this.statusSecondListView,
      statusThirdListView: statusThirdListView ?? this.statusThirdListView,
      statusText: statusText ?? this.statusText,
      statusFavorite: statusFavorite ?? this.statusFavorite,
      category: category ?? this.category,
      firstListView: firstListView ?? this.firstListView,
      secondListView: secondListView ?? this.secondListView,
      thirdListView: thirdListView ?? this.thirdListView,
      message: message ?? this.message,
      position: position ?? this.position,
    );
  }

  @override
  List<Object> get props => [
        statusCategory,
        statusFirstListView,
        statusSecondListView,
        statusThirdListView,
        statusFavorite,
        category,
        firstListView,
        secondListView,
        thirdListView,
        position,
      ];
}
