import 'package:asbeza_mobile_app/item/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class ItemLoad extends ItemEvent {}

class ItemCreate extends ItemEvent {
  final Item item;

  ItemCreate({required this.item});
}

class ItemUpdate extends ItemEvent {
  final Item item;

  ItemUpdate({required this.item});
}

class ItemDelete extends ItemEvent {
  final int id;

  ItemDelete({required this.id});
}
