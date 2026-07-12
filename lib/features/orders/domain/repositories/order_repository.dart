import 'package:dartz/dartz.dart' hide Order;

import '../../../../core/error/failures.dart';
import '../../../../core/models/paginated_response.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, PaginatedResponse<Order>>> getOrders({
    required int page,
    String? status,
  });
}
