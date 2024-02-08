// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ThirdListViewEntity extends Equatable {
  final String title;
  final String price;
  final int id;
  final bool isFavorite;
  const ThirdListViewEntity({
    required this.title,
    required this.price,
    required this.id,
    required this.isFavorite,
  });
  @override
  List<Object?> get props => [title, price, id, isFavorite];
}
