import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baby_step_up_app/model/model.dart';
import 'package:baby_step_up_app/widgets/widgets.dart';

class CartTile extends ConsumerWidget {
  CartTile({
    required this.cartItem,
  }) : super(key: ValueKey(cartItem.item.id));

  final CartItem cartItem;
  Item get item => cartItem.item;

  static const _indent = 16.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: _indent),
          height: 96,
          child: Row(
            children: [
              ItemImage(imageUrl: item.imageUrl),
              const SizedBox(width: 8),
              ItemInfo(
                title: item.title,
                price: item.priceWithUnit,
                info: Text(
                  '数量 ${cartItem.quantity}',
                  style: theme.textTheme.caption,
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).delete(item);
                },
                child: Text(
                  '削除',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(indent: _indent,),
      ],
    );
  }
}
