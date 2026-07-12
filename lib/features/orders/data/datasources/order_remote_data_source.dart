import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/order_model.dart';
import '../../../../core/models/paginated_response.dart';

abstract class OrderRemoteDataSource {
  Future<PaginatedResponse<OrderModel>> getOrders({
    required int page,
    String? status,
  });
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiClient apiClient;

  OrderRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<PaginatedResponse<OrderModel>> getOrders({
    required int page,
    String? status,
  }) async {
    final queryParameters = <String, dynamic>{'page': page, 'limit': 15};
    if (status != null && status.isNotEmpty) {
      queryParameters['status'] = status;
    }

    final response = await apiClient.dio.get(
      ApiConstants.orders,
      queryParameters: queryParameters,
    );

    final apiResponse = ApiResponse<List<OrderModel>>.fromJson(response.data, (
      data,
    ) {
      final list = data['orders'] as List;
      return list
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });

    return PaginatedResponse<OrderModel>(
      data: apiResponse.data,
      currentPage: apiResponse.pagination?.currentPage ?? 1,
      totalPages: apiResponse.pagination?.totalPages ?? 1,
      total: apiResponse.pagination?.total ?? 0,
    );
  }
}
