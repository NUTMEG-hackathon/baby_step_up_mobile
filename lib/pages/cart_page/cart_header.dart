import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:baby_step_up_app/model/model.dart';

class CartHeader extends ConsumerWidget {
  const CartHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(
      cartProvider.select((s) => s.summary.totalPriceState),
    );

    return Container(
      height: 55,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          totalPrice,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )
        ),
      ),
    );
  }
}
