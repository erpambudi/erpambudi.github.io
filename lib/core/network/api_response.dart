/// Generic wrapper for API responses.
///
/// Standardizes the parsing of responses that follow the server format:
/// ```json
/// {
///   "data": { ... },
///   "message": "...",
///   "pagination": { "total": 10, "total_pages": 2, "page": 1, "limit": 10 }
/// }
/// ```
class ApiResponse<T> {
  final T data;
  final String? message;
  final PaginationMeta? pagination;

  const ApiResponse({required this.data, this.message, this.pagination});

  /// Creates an [ApiResponse] from a raw response map.
  ///
  /// [parser] is a function that converts the `data` field into [T].
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> data) parser,
  ) {
    return ApiResponse(
      data: parser(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      pagination: json['pagination'] != null
          ? PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Metadata for paginated API responses.
class PaginationMeta {
  final int total;
  final int totalPages;
  final int currentPage;
  final int limit;

  const PaginationMeta({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.limit,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      total: json['total'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      currentPage: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 10,
    );
  }

  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;
}
