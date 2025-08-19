import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarState {
  final int selectedIndex;
  final int? reTapped;

  NavBarState({
    required this.selectedIndex,
    this.reTapped,
  });

  NavBarState copyWith({
    int? selectedIndex,
    int? reTapped,
  }) {
    return NavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      reTapped: reTapped ?? this.reTapped,
    );
  }
}