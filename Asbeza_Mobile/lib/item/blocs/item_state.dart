import 'package:asbeza_mobile_app/item/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object?> get props => [];
}

class ItemLoading extends ItemState {}

class ItemOperationSuccess extends ItemState {
  final List<dynamic> items;

  ItemOperationSuccess([this.items = const []]);

  @override
  List<Object> get props => [items];
}

class ItemOperationFailure extends ItemState {}
