import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:e_commerce_app/Features/cart/domain/repositories/items_cart_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddOrderUseCase {
  final ItemsRepository repository;
  AddOrderUseCase(this.repository);

  Future<Either<Failure, Unit>> call(List<ItemEntity> orderList) async {
              // print("========================================${orderList.length}");

    return await repository.addOrder(orderList);
    
  }
}
