import 'package:alasfor/pages/home/screen/home_screen.dart';
import 'package:alasfor/pages/new_products/screen/new_products_screen.dart';
import 'package:alasfor/pages/profile/screen/profile_screen.dart';
import 'package:alasfor/pages/scanner/screen/scanner_screen.dart';
import 'package:alasfor/pages/winners/screen/winners_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<ChangePageEvent>(_changePage);
  }
  final TextEditingController searchController = TextEditingController();
  final pages = [
    const ProfileScreen(),
    const WinnersScreen(),
    const HomeScreen(),
    const NewProductsScreen(),
    const ScannerScreen(),
  ];

  Future<void> _changePage(
    ChangePageEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
