enum BlocStatus { initial, loading, success, failure, loadingMore }

mixin BaseStateMixin {
  bool get isLoading;
  bool get isSuccess;
  bool get isError;
  String get errorMessage;
}

abstract class BaseState {
  const BaseState({
    this.status = BlocStatus.initial,
    this.errorMessage = '',
  });

  final BlocStatus status;
  final String errorMessage;

  bool get isInitial => status == BlocStatus.initial;
  bool get isLoading => status == BlocStatus.loading;
  bool get isSuccess => status == BlocStatus.success;
  bool get isError => status == BlocStatus.failure;
  bool get isLoadingMore => status == BlocStatus.loadingMore;
  bool get hasError => errorMessage.isNotEmpty;
}

abstract class PaginatedState<T> extends BaseState {
  const PaginatedState({
    super.status,
    super.errorMessage,
    this.items = const [],
    this.currentPage = 1,
    this.hasReachedMax = false,
  });

  final List<T> items;
  final int currentPage;
  final bool hasReachedMax;

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  bool get canLoadMore => !hasReachedMax && !isLoading && !isLoadingMore;
}
