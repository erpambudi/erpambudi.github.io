import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/paginated_response.dart';
import 'pagination_state.dart';
import '../../error/exceptions.dart';

abstract class BasePaginationCubit<T, Params>
    extends Cubit<PaginationState<T, Params>> {
  BasePaginationCubit() : super(PaginationState<T, Params>());

  /// Abstract method to be overridden by child class for API calling
  Future<PaginatedResponse<T>> fetchItems(int page, Params? filter);

  /// Helper method to extract error messages safely
  String getErrorMessage(dynamic error) {
    if (error is ServerException) return error.message;
    if (error is NetworkException) return error.message;
    if (error is UnauthorizedException) return error.message;
    if (error is ApiTimeoutException) return error.message;
    if (error is RequestCancelledException) return error.message;

    return error.toString().replaceAll('Exception: ', '');
  }

  Future<void> fetchFirstPage({Params? filter, bool keepFilter = true}) async {
    final activeFilter = keepFilter ? (filter ?? state.currentFilter) : filter;

    emit(
      state.copyWith(
        status: PaginationStatus.loading,
        items: <T>[],
        currentPage: 1,
        hasReachedMax: false,
        currentFilter: activeFilter,
      ),
    );

    try {
      final response = await fetchItems(1, activeFilter);
      emit(
        state.copyWith(
          status: PaginationStatus.success,
          items: response.data,
          hasReachedMax: response.hasReachedMax,
          currentPage: response.currentPage,
          totalPages: response.totalPages,
          total: response.total,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PaginationStatus.failure,
          errorMessage: getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (state.hasReachedMax ||
        state.isLoadingMore ||
        state.status == PaginationStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;
      final response = await fetchItems(nextPage, state.currentFilter);

      emit(
        state.copyWith(
          status: PaginationStatus.success,
          items: List.of(state.items)..addAll(response.data),
          hasReachedMax: response.hasReachedMax,
          currentPage: response.currentPage,
          totalPages: response.totalPages,
          total: response.total,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  Future<void> applyFilter(Params filter) async {
    await fetchFirstPage(filter: filter, keepFilter: false);
  }

  Future<void> clearFilter() async {
    await fetchFirstPage(filter: null, keepFilter: false);
  }

  Future<void> refresh() async {
    await fetchFirstPage(filter: state.currentFilter, keepFilter: true);
  }
}
