// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AddedItemsEntity extends Equatable {
  final String title;
  final String subtitle;
  final int id;
  final int counter;
  const AddedItemsEntity({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.counter,
  });

  @override
  List<Object?> get props => throw [title, subtitle, id, counter];
}
