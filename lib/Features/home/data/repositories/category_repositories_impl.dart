// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/data/models/third_list_view_model.dart';
import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/second_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/home/data/datasources/category_remote_data_source.dart';
import 'package:e_commerce_app/Features/home/domain/entities/app_bar_category_entity.dart';
import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  CategoriesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remoteDataSource.getAllCategories();
        return Right(remoteCategory);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<FirstListViewEntity>>> getFirstListView() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remoteDataSource.getFirstListView();
        return Right(remoteCategory);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<SecondListViewEntity>>>
      getSecondListView() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remoteDataSource.getSecondListView();
        return Right(remoteCategory);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<ThirdListViewEntity>>> getThirdListView() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remoteDataSource.getThirdListView();
        return Right(remoteCategory);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }
  
    @override
  Future<Either<Failure, Unit>> updateFavorite(
      ThirdListViewEntity favorite) async {
    final ThirdListViewModel itemModel = ThirdListViewModel(
      isFavorite: favorite.isFavorite,
      title: favorite.title,
      price: favorite.price,
      id: favorite.id,
    );
    if (await networkInfo.isConnected) {
      await remoteDataSource.updateFavorite(itemModel);
      return const Right(unit);
    } else {
      return Left(OfflineFailure());
    }
  }
}
