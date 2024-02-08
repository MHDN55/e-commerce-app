// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SecondListViewEntity extends Equatable {
  final String title;
  final String priceAfter;
  final String priceBefore;
  final int id;
  const SecondListViewEntity({
    required this.title,
    required this.priceAfter,
    required this.priceBefore,
    required this.id,
  });
  @override
  List<Object?> get props => [title, priceAfter, priceBefore, id];
}
