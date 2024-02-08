// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

// class AddFavoriteEvent extends FavoriteEvent {
//   final List<ThirdListViewEntity> favoritesList;
//   const AddFavoriteEvent({
//     required this.favoritesList,
//   });

//   @override
//   List<Object> get props => [favoritesList];
// }

// class DeleteFavoriteEvent extends FavoriteEvent {
//   final List<ThirdListViewEntity> favoritesList;
//   const DeleteFavoriteEvent({
//     required this.favoritesList,
//   });

//   @override
//   List<Object> get props => [favoritesList];
// }

class UpdateFavoriteEvent extends FavoriteEvent {
  final ThirdListViewEntity favorite;
  const UpdateFavoriteEvent({
    required this.favorite,
  });

  @override
  List<Object> get props => [favorite];
}

class GetFavoritesEvent extends FavoriteEvent {}
