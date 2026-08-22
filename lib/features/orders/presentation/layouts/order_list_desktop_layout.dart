import 'package:flutter/material.dart';

import '../../../../core/constants/breakpoints.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/list/app_paginated_list_view.dart';
import '../../domain/entities/order.dart';
import '../cubit/order_list_cubit.dart';
import '../widgets/order_card.dart';
import '../widgets/order_filter_chips.dart';

class OrderListDesktopLayout extends StatelessWidget {
  const OrderListDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.orderList)),
      body: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.maxContentWidth,
              ),
              child: const OrderFilterChips(),
            ),
          ),
          Expanded(
            child: AppPaginatedListView<OrderListCubit, Order, String>(
              itemBuilder: (context, order) {
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: Breakpoints.maxContentWidth,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: OrderCard(order: order),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
