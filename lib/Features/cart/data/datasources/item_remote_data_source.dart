import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/cart/data/models/item_model.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/order_entity.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class ItemRemoteDataSource {
  // Future<Unit> addItem(ItemModel itemModel);
  Future<Unit> addOrder(List<ItemModel> orderList);
}

@LazySingleton(as: ItemRemoteDataSource)
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  // int counter = 0;

  // @override
  // Future<Unit> addItem(ItemModel itemModel) async {
  //   CollectionReference items = FirebaseFirestore.instance.collection('items');
  //   try {
  //     items.add({
  //       'id': itemModel.id,
  //       'title': itemModel.title,
  //       'subtitle': itemModel.subtitle,
  //       'counter': itemModel.counter,
  //     });
  //     return Future.value(unit);
  //   } catch (error) {
  //     throw ServerException();
  //   }
  // }

  @override
  Future<Unit> addOrder(List<ItemModel> itemsList) async {
    List<Map<String, dynamic>> emptyItemsList = [];
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("orders")
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();

    final OrderEntity orderEntity = OrderEntity(
      items: itemsList,
      id: querySnapshot.docs.length + 1,
    );
    for (ItemModel v in orderEntity.items) {
      emptyItemsList.add(v.toJson());
    }
    // OrderToAddModel ll = OrderToAddModel(
    //   id: orderEntity.id,
    //   userId: FirebaseAuth.instance.currentUser!.uid,
    //   items: FieldValue.arrayUnion(emptyItemsList),
    // );
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    try {
      await orders.add({
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'id': orderEntity.id,
        'items': FieldValue.arrayUnion(emptyItemsList),
      });
      return Future.value(unit);
    } catch (error) {
      throw ServerException();
    }
  }
}
