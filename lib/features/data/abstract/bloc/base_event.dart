abstract class BaseEvent {}

class FetchItems<T> extends BaseEvent {}



class SearchQuery<T> extends BaseEvent {
  final String query;
  SearchQuery(this.query);
}

class SortItems<T> extends BaseEvent {
  final int sortColumnIndex;
  final bool ascending;
  final Comparable Function(T item) property;

  SortItems(this.sortColumnIndex, this.ascending, this.property);
}
