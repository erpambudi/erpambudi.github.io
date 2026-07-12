import '../../../../core/bloc/pagination/base_pagination_cubit.dart';
import '../../../../core/models/paginated_response.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

class OrderListCubit extends BasePaginationCubit<Order, String> {
  final OrderRepository repository;

  OrderListCubit({required this.repository});

  @override
  Future<PaginatedResponse<Order>> fetchItems(int page, String? filter) async {
    final result = await repository.getOrders(page: page, status: filter);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );
  }
}
