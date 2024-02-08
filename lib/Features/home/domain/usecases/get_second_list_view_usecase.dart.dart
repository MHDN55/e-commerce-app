import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/domain/entities/second_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSecondListViewUseCase {
  final CategoriesRepository repository;
  GetSecondListViewUseCase(this.repository);

  Future<Either<Failure, List<SecondListViewEntity>>> call() async {
    return await repository.getSecondListView();
  }
}
