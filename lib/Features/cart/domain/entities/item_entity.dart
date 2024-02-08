// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ItemEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
   int counter =1;
   ItemEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.counter,
  });

  @override
  List<Object?> get props => [title, subtitle, id, counter];
}
