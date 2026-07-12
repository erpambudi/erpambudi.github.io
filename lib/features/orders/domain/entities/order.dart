import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final String orderNumber;
  final String customerName;
  final String status;
  final String paymentStatus;
  final double totalAmount;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.orderNumber,
    required this.customerName,
    required this.status,
    required this.paymentStatus,
    required this.totalAmount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    orderNumber,
    customerName,
    status,
    paymentStatus,
    totalAmount,
    createdAt,
  ];
}
