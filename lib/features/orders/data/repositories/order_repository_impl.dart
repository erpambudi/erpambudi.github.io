import 'package:dartz/dartz.dart' hide Order;

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/models/paginated_response.dart';
import '../../../../core/utils/repository_helper.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PaginatedResponse<Order>>> getOrders({
    required int page,
    String? status,
  }) async {
    return executeApiCall(
      networkInfo: networkInfo,
      call: () async {
        final models = await remoteDataSource.getOrders(
          page: page,
          status: status,
        );
        return PaginatedResponse<Order>(
          data: models.data,
          currentPage: models.currentPage,
          totalPages: models.totalPages,
          total: models.total,
        );
      },
    );
  }
}
