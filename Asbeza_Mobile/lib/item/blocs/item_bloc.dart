import 'blocs.dart';
import 'package:asbeza_mobile_app/item/repository/item-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({required this.itemRepository}) : super(ItemLoading());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is ItemLoad) {
      try {
        yield ItemLoading();
        final items = await itemRepository.fetchAll();
        yield ItemOperationSuccess(items);
      } catch (e) {
        print("$e");
        yield ItemOperationFailure();
      }
    }

    if (event is ItemCreate) {
      try {
        await itemRepository.create(event.item);
        final items = await itemRepository.fetchAll();
        yield ItemOperationSuccess(items);
      } catch (e) {
        print("$e");
        yield ItemOperationFailure();
      }
    }

    if (event is ItemUpdate) {
      try {
        await itemRepository.update(event.item.id ?? 0, event.item);
        final items = await itemRepository.fetchAll();
        yield ItemOperationSuccess(items);
      } catch (e) {
        print("$e");
        yield ItemOperationFailure();
      }
    }

    if (event is ItemDelete) {
      try {
        await itemRepository.delete(event.id);
        final items = await itemRepository.fetchAll();
        yield ItemOperationSuccess(items);
      } catch (e) {
        print("$e");
        yield ItemOperationFailure();
      }
    }
  }
}
