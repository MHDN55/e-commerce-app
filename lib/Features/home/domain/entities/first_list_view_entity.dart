// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FirstListViewEntity extends Equatable {
  final String title;
  final String price;
  final int id;
  final String imageUrl;
  const FirstListViewEntity({
    required this.title,
    required this.price,
    required this.id,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [title, price, id, imageUrl];
}
