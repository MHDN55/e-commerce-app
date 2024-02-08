import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/domain/entities/app_bar_category_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/second_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/core/error/failures.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, List<FirstListViewEntity>>> getFirstListView();
  Future<Either<Failure, List<SecondListViewEntity>>> getSecondListView();
  Future<Either<Failure, List<ThirdListViewEntity>>> getThirdListView();
  Future<Either<Failure, Unit>> updateFavorite(ThirdListViewEntity favorite);
}
