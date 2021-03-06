import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:baby_step_up_app/model/model.dart';
import 'package:baby_step_up_app/pages/cart_page/cart_page.dart';
import 'package:baby_step_up_app/widgets/widgets.dart';

class CartButton extends ConsumerWidget {
  const CartButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmpty = ref.watch(
      cartProvider.select((s) => s.summary.totalPrice == 0),
    );

    return NavigationBarButton(
      text: ref.watch(cartProvider.select((s) => s.summary.state)),
      onPressed: isEmpty
          ? null
          : () => Navigator.of(context).push<void>(CupertinoPageRoute<void>(
              builder: (context) => const CartPage(), fullscreenDialog: true)),
    );
  }
}
