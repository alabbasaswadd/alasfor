import 'package:alasfor/pages/home/screen/home_screen.dart';
import 'package:alasfor/pages/new_products/screen/new_products_screen.dart';
import 'package:alasfor/pages/profile/screen/profile_screen.dart';
import 'package:alasfor/pages/scanner/screen/scanner_screen.dart';
import 'package:alasfor/pages/winners/screen/winners_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<InitMainEvent>(_init);
    on<ChangeTabEvent>(_changePage);
  }
  final pages = [
    const ProfileScreen(),
    const WinnersScreen(),
    const HomeScreen(),
    const NewProductsScreen(),
    const ScannerScreen(),
  ];
  // Widget _buildCurrentPage(int index) {

  //   return pages[index < pages.length ? index : 0];
  // }
  Future<void> _init(InitMainEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(currentIndex: 2, isHomeTab: true));
  }

  Future<void> _changePage(
    ChangeTabEvent event,
    Emitter<MainState> emit,
  ) async {
    final index = event.index;
    emit(state.copyWith(currentIndex: index));
  }
}
