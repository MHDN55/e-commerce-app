// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, changed, loading, error }

class FavoriteState extends Equatable {
  final FavoriteStatus status;
  final ThirdListViewEntity favorite;
  final List<ThirdListViewEntity> favoritesList;
  final String message;
  const FavoriteState({
    required this.status,
    required this.favorite,
    required this.favoritesList,
    required this.message,
  });

  FavoriteState copyWith({
    FavoriteStatus? status,
    ThirdListViewEntity? favorite,
    List<ThirdListViewEntity>? favoritesList,
    String? message,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favorite: favorite ?? this.favorite,
      favoritesList: favoritesList ?? this.favoritesList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, favorite, message, favoritesList];
}
