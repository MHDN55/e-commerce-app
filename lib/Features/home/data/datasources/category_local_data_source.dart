// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_commerce_app/Features/home/data/models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<Unit> cacheCategory(List<CategoryModel> categoryModels);
}
@LazySingleton(as: CategoryLocalDataSource)
class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences prefs;
  CategoryLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<Unit> cacheCategory(List<CategoryModel> categoryModels) {
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() {
    throw UnimplementedError();
  }
}
