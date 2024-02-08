import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/home/data/models/category_model.dart';
import 'package:e_commerce_app/Features/home/data/models/first_list_view_model.dart';
import 'package:e_commerce_app/Features/home/data/models/second_list_view_model.dart';
import 'package:e_commerce_app/Features/home/data/models/third_list_view_model.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<FirstListViewModel>> getFirstListView();
  Future<List<SecondListViewModel>> getSecondListView();
  Future<List<ThirdListViewModel>> getThirdListView();
  Future<Unit> updateFavorite(ThirdListViewModel favorite);
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final List<CategoryModel> categoriesList = [];
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("categories").get();

    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      categoriesList.add(CategoryModel.fromJson(doc.data()));
    }

    return categoriesList;
  }

  @override
  Future<List<FirstListViewModel>> getFirstListView() async {
    final List<FirstListViewModel> categoriesList = [];
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("first_list_view").get();

    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      categoriesList.add(FirstListViewModel.fromJson(doc.data()));
    }

    return categoriesList;
  }

  @override
  Future<List<SecondListViewModel>> getSecondListView() async {
    final List<SecondListViewModel> categoriesList = [];
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("second_list_view").get();

    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      categoriesList.add(SecondListViewModel.fromJson(doc.data()));
    }

    return categoriesList;
  }

  @override
  Future<List<ThirdListViewModel>> getThirdListView() async {
    final List<ThirdListViewModel> categoriesList = [];
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("third_list_view")
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();

    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      categoriesList.add(ThirdListViewModel.fromJson(doc.data()));
    }
    return categoriesList;
  }

  @override
  Future<Unit> updateFavorite(ThirdListViewModel favorite) async {
    CollectionReference favoriteList =
        FirebaseFirestore.instance.collection('third_list_view');

    try {
      await favoriteList.doc("${favorite.id}").update({
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'isFavorite': favorite.isFavorite,
      });
      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }
}
