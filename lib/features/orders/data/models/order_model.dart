import '../../domain/entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.orderNumber,
    required super.customerName,
    required super.status,
    required super.paymentStatus,
    required super.totalAmount,
    required super.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int? ?? 0,
      orderNumber: json['order_number'] as String? ?? '',
      customerName: json['customer_name'] as String? ?? 'No Name',
      status: json['status'] as String? ?? 'Diterima',
      paymentStatus: json['payment_status'] as String? ?? 'Belum Bayar',
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }
}
