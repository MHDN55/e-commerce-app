// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/domain/entities/app_bar_category_entity.dart';
import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllCategoriesUseCase {
  final CategoriesRepository repository;
  GetAllCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getAllCategories();
  }
}
