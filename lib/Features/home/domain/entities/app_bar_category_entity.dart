// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;

  const CategoryEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
