enum PaginationStatus { initial, loading, success, failure }

class PaginationState<T, Params> {
  final PaginationStatus status;
  final List<T> items;
  final bool hasReachedMax;
  final String? errorMessage;
  final int currentPage;
  final int totalPages;
  final int total;
  final Params? currentFilter;
  final bool isLoadingMore;

  const PaginationState({
    this.status = PaginationStatus.initial,
    this.items = const [],
    this.hasReachedMax = false,
    this.errorMessage,
    this.currentPage = 1,
    this.totalPages = 1,
    this.total = 0,
    this.currentFilter,
    this.isLoadingMore = false,
  });

  PaginationState<T, Params> copyWith({
    PaginationStatus? status,
    List<T>? items,
    bool? hasReachedMax,
    String? errorMessage,
    int? currentPage,
    int? totalPages,
    int? total,
    Params? currentFilter,
    bool? isLoadingMore,
    bool clearError = false,
  }) {
    return PaginationState<T, Params>(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
      currentFilter: currentFilter ?? this.currentFilter,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
