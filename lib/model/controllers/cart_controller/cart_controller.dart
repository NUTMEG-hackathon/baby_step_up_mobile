import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:baby_step_up_app/model/model.dart';

import 'cart_state.dart';

export 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartController, CartState>(
  (ref) => CartController(),
);

class CartController extends StateNotifier<CartState> {
  CartController() : super(CartState());

  void add(Item item) {
    state = state.copyWith(itemMap: {
      ...state.itemMap,
      item.id: (state.itemMap[item.id] ??
              CartItem(
                item: item,
                quantity: 0,
              ))
          .increased(),
    });
  }

  void delete(Item item) {
    state = state.copyWith(
      itemMap: {
        ...state.itemMap,
        item.id: state.itemMap[item.id]!.decreased()
      }..removeWhere((key, value) => value.quantity <= 0),
    );
  }
}
