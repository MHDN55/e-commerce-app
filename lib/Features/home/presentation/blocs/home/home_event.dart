// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends HomeEvent {}

class GetFirstListViewEvent extends HomeEvent {}

class GetSecondListViewEvent extends HomeEvent {}

class GetThirdListViewEvent extends HomeEvent {}

class ScrollEvent extends HomeEvent {
  final int position;
  const ScrollEvent({
    required this.position,
  });
  @override
  List<Object> get props => [position];
}

// class UpdateFavoriteEvent extends HomeEvent {
//   final ThirdListViewEntity favorite;
//   const UpdateFavoriteEvent({
//     required this.favorite,
//   });

//   @override
//   List<Object> get props => [favorite];
// }
