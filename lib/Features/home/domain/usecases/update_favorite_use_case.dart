import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateFevoriteUsecase {
  final CategoriesRepository repository;
  UpdateFevoriteUsecase(this.repository);

  Future<Either<Failure, Unit>> call(ThirdListViewEntity favorite) async {

    return await repository.updateFavorite(favorite);
  }
}
