// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:e_commerce_app/Features/home/data/models/third_list_view_model.dart';
// import 'package:e_commerce_app/core/error/exceptions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:injectable/injectable.dart';

// abstract class FavoritesRemoteDataSourse {
//   Future<Unit> addFavorite(List<ThirdListViewModel> favorites);
//   Future<Unit> deleteFavorite(List<ThirdListViewModel> favorites);
//   Future<Unit> updateFavorite(ThirdListViewModel favorite);
//   Future<List<ThirdListViewModel>> getFavorites();
// }

// @LazySingleton(as: FavoritesRemoteDataSourse)
// class FavoritesRemoteDataSourseImpl implements FavoritesRemoteDataSourse {
//   @override
//   Future<Unit> addFavorite(List<ThirdListViewModel> favorites) async {
//     CollectionReference favorite =
//         FirebaseFirestore.instance.collection('favorites');
//     for (var i = 0; i < favorites.length; i++) {
//       try {
//         await favorite.doc("${favorites[i].id}").set({
//           'userId': FirebaseAuth.instance.currentUser!.uid,
//           'id': favorites[i].id,
//           'title': favorites[i].title,
//           'price': favorites[i].price,
//         });
//       } catch (e) {
//         throw ServerException();
//       }
//     }

//     return Future.value(unit);
//   }

//   @override
//   Future<Unit> deleteFavorite(List<ThirdListViewModel> favorites) async {
//     CollectionReference favorite =
//         FirebaseFirestore.instance.collection('favorites');
//     for (var i = 0; i < favorites.length; i++) {
//       try {
//         await favorite.doc("${favorites[i].id}").delete();
//       } catch (e) {
//         throw ServerException();
//       }
//     }

//     return Future.value(unit);
//   }

//   @override
//   Future<List<ThirdListViewModel>> getFavorites() async {
//     final List<ThirdListViewModel> addedFavoritesList = [];

//     final QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance
//             .collection("favorites")
//             .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .get();

//     final queryAfterMap = querySnapshot.docs;
//     for (var doc in queryAfterMap) {
//       addedFavoritesList.add(
//         ThirdListViewModel.fromJson(
//           doc.data(),
//         ),
//       );
//     }
//     return addedFavoritesList;
//   }

//   @override
//   Future<Unit> updateFavorite(ThirdListViewModel favorite) async {
//     CollectionReference favoriteList =
//         FirebaseFirestore.instance.collection('third_list_view');

//     try {
//       await favoriteList.doc("${favorite.id}").update({
//         'userId': FirebaseAuth.instance.currentUser!.uid,
//         'isFavorite': favorite.isFavorite,
//         'id': favorite.id,
//         'title': favorite.title,
//         'price': favorite.price,
//       });
//       return Future.value(unit);
//     } catch (e) {
//       throw ServerException();
//     }
//   }
// }
