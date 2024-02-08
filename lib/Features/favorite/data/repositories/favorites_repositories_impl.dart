// // ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

// import 'package:dartz/dartz.dart';
// import 'package:e_commerce_app/Features/home/data/models/third_list_view_model.dart';
// import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
// import 'package:e_commerce_app/core/error/exceptions.dart';
// import 'package:injectable/injectable.dart';

// import 'package:e_commerce_app/Features/favorite/data/datasources/favorites_remote_data_sourse.dart';
// import 'package:e_commerce_app/Features/favorite/domain/repositories/favorites_repositories.dart';
// import 'package:e_commerce_app/core/error/failures.dart';
// import 'package:e_commerce_app/core/network/network_info.dart';

// @LazySingleton(as: FavoritesRepository)
// class FavoritesRepositoryImpl implements FavoritesRepository {
//   final FavoritesRemoteDataSourse remoteDataSource;
//   final NetworkInfo networkInfo;
//   FavoritesRepositoryImpl({
//     required this.remoteDataSource,
//     required this.networkInfo,
//   });
//   @override
//   Future<Either<Failure, Unit>> addFavorite(
//       List<ThirdListViewEntity> favorites) async {
//     final List<ThirdListViewModel> emptyItemsList = [];

//     if (favorites.isNotEmpty) {
//       for (var i = 0; i < favorites.length; i++) {
//         final ThirdListViewModel itemModel = ThirdListViewModel(
//           isFavorite: favorites[i].isFavorite,
//           title: favorites[i].title,
//           price: favorites[i].price,
//           id: favorites[i].id,
//         );
//         emptyItemsList.add(itemModel);
//       }
//       if (await networkInfo.isConnected) {
//         await remoteDataSource.addFavorite(emptyItemsList);
//         return const Right(unit);
//       } else {
//         return Left(OfflineFailure());
//       }
//     }
//     return Left(OfflineFailure());
//   }

//   @override
//   Future<Either<Failure, List<ThirdListViewEntity>>> getFavorites() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteAddedFavorites = await remoteDataSource.getFavorites();
//         return Right(remoteAddedFavorites);
//       } on ServerException {
//         Left(ServerFailure());
//       } catch (e) {
//         print("=========================================$e");
//       }
//     }
//     return Left(ServerFailure());
//   }

//   @override
//   Future<Either<Failure, Unit>> deleteFavorite(
//       List<ThirdListViewEntity> favorites) async {
//     final List<ThirdListViewModel> emptyItemsList = [];

//     if (favorites.isNotEmpty) {
//       for (var i = 0; i < favorites.length; i++) {
//         final ThirdListViewModel itemModel = ThirdListViewModel(
//           isFavorite: favorites[i].isFavorite,
//           title: favorites[i].title,
//           price: favorites[i].price,
//           id: favorites[i].id,
//         );
//         emptyItemsList.add(itemModel);
//       }
//       if (await networkInfo.isConnected) {
//         await remoteDataSource.deleteFavorite(emptyItemsList);
//         return const Right(unit);
//       } else {
//         return Left(OfflineFailure());
//       }
//     }
//     return Left(OfflineFailure());
//   }

//   @override
//   Future<Either<Failure, Unit>> updateFavorite(
//       ThirdListViewEntity favorite) async {
//     final ThirdListViewModel itemModel = ThirdListViewModel(
//       isFavorite: favorite.isFavorite,
//       title: favorite.title,
//       price: favorite.price,
//       id: favorite.id,
//     );
//     if (await networkInfo.isConnected) {
//       await remoteDataSource.updateFavorite(itemModel);
//       return const Right(unit);
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }
