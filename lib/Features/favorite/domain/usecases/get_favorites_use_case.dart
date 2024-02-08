// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';
// import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
// import 'package:e_commerce_app/core/error/failures.dart';
// import 'package:injectable/injectable.dart';

// import 'package:e_commerce_app/Features/favorite/domain/repositories/favorites_repositories.dart';

// @lazySingleton
// class GetFavoritesUseCase {
//   final FavoritesRepository repository;
//   GetFavoritesUseCase(
//     this.repository,
//   );
//   Future<Either<Failure, List<ThirdListViewEntity>>> call() async {
//     return await repository.getFavorites();
//   }
// }
