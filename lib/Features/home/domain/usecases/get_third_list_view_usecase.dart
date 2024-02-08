import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetThirdListViewUseCase {
  final CategoriesRepository repository;
  GetThirdListViewUseCase(this.repository);

  Future<Either<Failure, List<ThirdListViewEntity>>> call() async {
    return await repository.getThirdListView();
  }
}
