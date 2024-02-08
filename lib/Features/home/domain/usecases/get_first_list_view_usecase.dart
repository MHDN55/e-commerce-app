// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/domain/entities/first_list_view_entity.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/home/domain/repositories/category_repositories.dart';

@lazySingleton
class GetFirstListViewUseCase {
  final CategoriesRepository repository;
  GetFirstListViewUseCase(this.repository);
  Future<Either<Failure, List<FirstListViewEntity>>> call() async {
    return await repository.getFirstListView();
  }
}
