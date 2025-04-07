import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_event.dart';
import 'base_state.dart';

typedef FetchItemsFn<T> = Future<List<T>> Function();
typedef DeleteItemFn<T> = Future<void> Function(T item);
typedef ContainsSearchQueryFn<T> = bool Function(T item, String query);

class BaseBloc<T> extends Bloc<BaseEvent, BaseState<T>> {
  final FetchItemsFn<T> fetchItemsFn;
  
  final ContainsSearchQueryFn<T> containsSearchQueryFn;

  List<T> _allItems = [];
  List<T> _filteredItems = [];
  int _sortColumnIndex = 0;
  bool _ascending = true;

  BaseBloc({
    required this.fetchItemsFn,

    required this.containsSearchQueryFn,
  }) : super(BaseInitial<T>()) {
    on<FetchItems<T>>((event, emit) async {
      emit(BaseLoading<T>());
      try {
        _allItems = await fetchItemsFn();
        _filteredItems = _allItems;
        emit(
          BaseLoaded(
            allItems: _allItems,
            filteredItems: _filteredItems,
            sortColumnIndex: _sortColumnIndex,
            ascending: _ascending,
          ),
        );
      } catch (e) {
        emit(BaseError<T>(e.toString()));
      }
    });

    

    on<SearchQuery<T>>((event, emit) {
      final query = event.query.toLowerCase();
      _filteredItems =
          _allItems
              .where((item) => containsSearchQueryFn(item, query))
              .toList();

      emit(
        BaseLoaded(
          allItems: _allItems,
          filteredItems: _filteredItems,
          sortColumnIndex: _sortColumnIndex,
          ascending: _ascending,
        ),
      );
    });

    on<SortItems<T>>((event, emit) {
      _sortColumnIndex = event.sortColumnIndex;
      _ascending = event.ascending;

      _filteredItems.sort((a, b) {
        final aVal = event.property(a);
        final bVal = event.property(b);
        return _ascending ? aVal.compareTo(bVal) : bVal.compareTo(aVal);
      });

      emit(
        BaseLoaded(
          allItems: _allItems,
          filteredItems: _filteredItems,
          sortColumnIndex: _sortColumnIndex,
          ascending: _ascending,
        ),
      );
    });
  }
}
