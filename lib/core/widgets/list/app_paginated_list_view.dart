import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/app_colors.dart';
import '../../utils/l10n_extension.dart';
import '../feedback/empty_state_widget.dart';
import '../../bloc/pagination/pagination_state.dart';

class AppPaginatedListView<
  C extends Cubit<PaginationState<T, Params>>,
  T,
  Params
>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Widget? emptyWidget;
  final EdgeInsetsGeometry padding;
  final Widget Function(
    BuildContext context,
    String message,
    VoidCallback onRetry,
  )?
  errorBuilder;

  const AppPaginatedListView({
    super.key,
    required this.itemBuilder,
    this.emptyWidget,
    this.padding = const EdgeInsets.all(16),
    this.errorBuilder,
  });

  @override
  State<AppPaginatedListView<C, T, Params>> createState() =>
      _AppPaginatedListViewState<C, T, Params>();
}

class _AppPaginatedListViewState<
  C extends Cubit<PaginationState<T, Params>>,
  T,
  Params
>
    extends State<AppPaginatedListView<C, T, Params>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  bool _isFetching = false;

  void _onScroll() {
    if (_isBottom && !_isFetching) {
      _isFetching = true;
      final cubit = context.read<C>();
      try {
        (cubit as dynamic).loadMore().whenComplete(() {
          if (mounted) {
            // Add a small delay before allowing another fetch to prevent rapid firing
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                _isFetching = false;
              }
            });
          }
        });
      } catch (e) {
        debugPrint(
          'AppPaginatedListView: Cubit does not have loadMore() method. Error: $e',
        );
        _isFetching = false;
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 200); // Trigger load more 200px early
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, PaginationState<T, Params>>(
      builder: (context, state) {
        if (state.status == PaginationStatus.initial ||
            (state.status == PaginationStatus.loading && state.items.isEmpty)) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        if (state.status == PaginationStatus.failure && state.items.isEmpty) {
          if (widget.errorBuilder != null) {
            return widget.errorBuilder!(
              context,
              state.errorMessage ?? 'Terjadi kesalahan',
              () => (context.read<C>() as dynamic).refresh(),
            );
          }
          return EmptyStateWidget(
            icon: Icons.error_outline_rounded,
            title: context.l10n.errorOccurred,
            subtitle: state.errorMessage ?? 'Gagal memuat data',
            buttonText: 'Coba Lagi',
            onButtonPressed: () => (context.read<C>() as dynamic).refresh(),
          );
        }

        if (state.items.isEmpty) {
          return widget.emptyWidget ??
              EmptyStateWidget(
                icon: Icons.folder_open_outlined,
                title: context.l10n.emptyData,
                subtitle: 'Belum ada data untuk ditampilkan.',
                buttonText: 'Muat Ulang',
                onButtonPressed: () => (context.read<C>() as dynamic).refresh(),
              );
        }

        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async => (context.read<C>() as dynamic).refresh(),
          child: ListView.builder(
            controller: _scrollController,
            padding: widget.padding,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.items.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                );
              }
              return widget.itemBuilder(context, state.items[index]);
            },
          ),
        );
      },
    );
  }
}
