import 'package:ecommerce/core/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  List<String> _allItems = [];

  void setItems(List<String> items) {
    _allItems = items;
    emit(state.copyWith(searchResults: [], hasSearched: false));
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(searchResults: [], hasSearched: false));
    } else {
      final results = _allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(state.copyWith(searchResults: results, hasSearched: true));
    }
  }
}
