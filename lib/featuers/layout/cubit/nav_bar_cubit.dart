import 'package:ecommerce/featuers/layout/cubit/nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit({int initialIndex = 0})
    : super(NavBarState(selectedIndex: initialIndex));

  void setTab(int index) {
    if (index == state.selectedIndex) {
      emit(state.copyWith(reTapped: DateTime.now().millisecondsSinceEpoch));
      return;
    }
    emit(state.copyWith(selectedIndex: index));
  }
}
