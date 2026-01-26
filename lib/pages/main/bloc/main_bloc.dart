import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<InitMainEvent>(_init);
    on<ChangeTabEvent>(_changeTab);
  }

  Future<void> _init(InitMainEvent event, Emitter<MainState> emit) async {
    emit(
      state.copyWith(currentIndex: 2, isHomeTab: false, isNewProductsTab: true),
    );
  }

  Future<void> _changeTab(ChangeTabEvent event, Emitter<MainState> emit) async {
    final index = event.index;
    emit(
      state.copyWith(
        currentIndex: index,
        isHomeTab: index == 2,
        isNewProductsTab: index == 3,
      ),
    );
  }
}
