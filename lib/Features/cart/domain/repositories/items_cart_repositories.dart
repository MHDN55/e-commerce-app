import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:e_commerce_app/core/error/failures.dart';

abstract class ItemsRepository {
  // Future<Either<Failure, Unit>> addItem(List<ItemEntity> item);
  Future<Either<Failure, Unit>> addOrder(List<ItemEntity> orderList);
}
