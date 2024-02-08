// ignore_for_file: avoid_print

// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/Features/profile/data/models/order_list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

abstract class AddedItemsRemoteDataSource {
  // Future<List<AddedItemsModel>> getAddedItems();
  Future<List<OrdersListModel>> getAddedOrders();
  Future<List<UserModel>> getCurrentUser();
  Future<String> addProfileImage(File file, String imageName);
}

@LazySingleton(as: AddedItemsRemoteDataSource)
class AddedItemsRemoteDataSourceImpl implements AddedItemsRemoteDataSource {
  // @override
  // Future<List<AddedItemsModel>> getAddedItems() async {
  //   final List<AddedItemsModel> addedItemsList = [];

  //   final QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //       await FirebaseFirestore.instance.collection("items").get();

  //   final queryAfterMap = querySnapshot.docs;

  //   for (var doc in queryAfterMap) {
  //     print(doc.data());
  //     addedItemsList.add(AddedItemsModel.fromJson(doc.data()));
  //     // print("===========================================$addedItemsList");
  //   }
  //   return addedItemsList;
  // }

  @override
  Future<List<OrdersListModel>> getAddedOrders() async {
    final List<OrdersListModel> addedOrdersList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("orders")
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();

    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      addedOrdersList.add(OrdersListModel.fromJson(doc.data()));
    }
    return addedOrdersList;
  }

  @override
  Future<List<UserModel>> getCurrentUser() async {
    final List<UserModel> usersList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("users")
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
    final queryAfterMap = querySnapshot.docs;
    for (var doc in queryAfterMap) {
      usersList.add(UserModel.fromJson(doc.data()));
    }
    return usersList;
  }

  @override
  Future<String> addProfileImage(File file, String imageName) async {
    var refStore = FirebaseStorage.instance.ref(imageName);
    await refStore.putFile(file);
    final url = await refStore.getDownloadURL();
    return url;
  }
}
