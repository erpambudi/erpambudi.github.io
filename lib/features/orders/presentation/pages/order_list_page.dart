import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/responsive/responsive_builder.dart';
import '../../../../injection_container.dart';

import '../../../auth/presentation/cubit/auth_cubit.dart';

import '../cubit/order_list_cubit.dart';

import '../layouts/order_list_desktop_layout.dart';
import '../layouts/order_list_mobile_layout.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  static Widget create() {
    return BlocProvider<OrderListCubit>(
      create: (_) => sl<OrderListCubit>(),
      child: const OrderListPage(),
    );
  }

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderListCubit>().fetchFirstPage();
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context, constraints) =>
          OrderListMobileLayout(onLogout: _showLogoutConfirmation),
      desktop: (context, constraints) =>
          OrderListDesktopLayout(onLogout: _showLogoutConfirmation),
    );
  }
}
