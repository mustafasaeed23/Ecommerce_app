class SearchState {
  final bool isLoading;
  final List<String> searchResults;
  final String? errorMessage;
  final bool hasSearched; // 👈 new flag

  SearchState({
    this.isLoading = false,
    this.searchResults = const [],
    this.errorMessage,
    this.hasSearched = false,
  });

  SearchState copyWith({
    bool? isLoading,
    List<String>? searchResults,
    String? errorMessage,
    bool? hasSearched,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      searchResults: searchResults ?? this.searchResults,
      errorMessage: errorMessage ?? this.errorMessage,
      hasSearched: hasSearched ?? this.hasSearched,
    );
  }
}
