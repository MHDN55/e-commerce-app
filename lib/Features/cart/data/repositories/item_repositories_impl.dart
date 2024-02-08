import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/cart/data/datasources/item_remote_data_source.dart';
import 'package:e_commerce_app/Features/cart/data/models/item_model.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:e_commerce_app/Features/cart/domain/repositories/items_cart_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ItemsRepository)
class ItemsRepositoryImpl implements ItemsRepository {
  final ItemRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ItemsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // @override
  // Future<Either<Failure, Unit>> addItem(List<ItemEntity> item) async {
  //   if (item.isNotEmpty) {
  //     for (var i = 0; i < item.length; i++) {
  //       final ItemModel itemModel = ItemModel(
  //         title: item[i].title,
  //         subtitle: item[i].subtitle,
  //         id: item[i].id,
  //         counter: item[i].counter,
  //       );

  //       if (await networkInfo.isConnected) {
  //         try {
  //           await remoteDataSource.addItem(itemModel);
  //         } catch (e) {
  //           return Left(ServerFailure());
  //         }
  //       }
  //     }
  //     if (await networkInfo.isConnected) {
  //       return const Right(unit);
  //     } else {
  //       return Left(OfflineFailure());
  //     }
  //   }
  //   return Left(OfflineFailure());
  // }

  @override
  Future<Either<Failure, Unit>> addOrder(List<ItemEntity> itemsList) async {

    final List<ItemModel> emptyItemsList = [];


    if (itemsList.isNotEmpty) {
      for (var i = 0; i < itemsList.length; i++) {
        final ItemModel itemModel = ItemModel(
          title: itemsList[i].title,
          subtitle: itemsList[i].subtitle,
          id: itemsList[i].id,
          counter: itemsList[i].counter,
        );
        emptyItemsList.add(itemModel);
      }
      if (await networkInfo.isConnected) {
           await remoteDataSource.addOrder(emptyItemsList);
        return const Right(unit);
      } else {
        return Left(OfflineFailure());
      }
    }
    return Left(OfflineFailure());
  }
}
