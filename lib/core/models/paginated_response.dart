class PaginatedResponse<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;
  final int total;

  PaginatedResponse({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    this.total = 0,
  });

  bool get hasReachedMax => currentPage >= totalPages;
}
