abstract class BaseState<T> {}

class BaseInitial<T> extends BaseState<T> {}

class BaseLoading<T> extends BaseState<T> {}

class BaseLoaded<T> extends BaseState<T> {
  final List<T> allItems;
  final List<T> filteredItems;
  final int sortColumnIndex;
  final bool ascending;

  BaseLoaded({
    required this.allItems,
    required this.filteredItems,
    this.sortColumnIndex = 0,
    this.ascending = true,
  });
}

class BaseError<T> extends BaseState<T> {
  final String message;
  BaseError(this.message);
}
