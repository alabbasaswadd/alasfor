import 'package:alasfor/pages/winners/model/winners_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'winners_event.dart';
import 'winners_state.dart';

class WinnersBloc extends BaseBloc<WinnersEvent, WinnersState> {
  WinnersBloc() : super(const WinnersState()) {
    on<GetWinnersEvent>(_getWinners);
    on<RefreshWinnersEvent>(_refreshWinners);
    on<LoadMoreWinnersEvent>(_loadMoreWinners);
    on<FilterWinnersByMonthEvent>(_filterWinnersByMonth);
  }
  // Mock data for testing
  List<WinnerModel> getMockWinners() {
    return [
      const WinnerModel(
        id: '1',
        name: 'علاء ياسر',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=11',
      ),
      const WinnerModel(
        id: '2',
        name: 'معتصم الخولي',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=12',
      ),
      const WinnerModel(
        id: '3',
        name: 'محمد اليوسف',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=13',
      ),
      const WinnerModel(
        id: '4',
        name: 'صفا طعان',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=14',
      ),
      const WinnerModel(
        id: '5',
        name: 'أحمد محمود',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=15',
      ),
      const WinnerModel(
        id: '6',
        name: 'سارة علي',
        prize: 'فاز بجهاز ايفون 15',
        date: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=16',
      ),
    ];
  }

  Future<void> _getWinners(
    GetWinnersEvent event,
    Emitter<WinnersState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        isError: false,
        currentPage: 1,
        hasReachedMax: false,
      ),
    );

    try {
      // TODO: Replace with actual API call when ready
      // await handleApiCall<List<WinnerModel>>(
      //   emit: emit,
      //   apiCall: () => _api.getWinners(page: 1),
      //   loadingState: () => state.copyWith(isLoading: true),
      //   successState: (winners) => state.copyWith(
      //     isLoading: false,
      //     isSuccess: true,
      //     winners: winners,
      //     currentPage: 1,
      //     hasReachedMax: winners.isEmpty,
      //   ),
      //   errorState: (error) => state.copyWith(
      //     isLoading: false,
      //     isError: true,
      //     errorMessage: error,
      //   ),
      //   dataParser: (data) => (data as List)
      //       .map((json) => WinnerModel.fromJson(json))
      //       .toList(),
      //   defaultErrorMessage: 'فشل تحميل قائمة الفائزين',
      // );

      // Using mock data for now
      await Future.delayed(const Duration(milliseconds: 300));
      final winners = getMockWinners();

      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          winners: winners,
          currentPage: 1,
          hasReachedMax: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _refreshWinners(
    RefreshWinnersEvent event,
    Emitter<WinnersState> emit,
  ) async {
    add(const GetWinnersEvent());
  }

  Future<void> _loadMoreWinners(
    LoadMoreWinnersEvent event,
    Emitter<WinnersState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(milliseconds: 500));

      final newWinners = <WinnerModel>[];

      emit(
        state.copyWith(
          isLoadingMore: false,
          winners: [...state.winners, ...newWinners],
          currentPage: nextPage,
          hasReachedMax: newWinners.isEmpty,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingMore: false,
          isError: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _filterWinnersByMonth(
    FilterWinnersByMonthEvent event,
    Emitter<WinnersState> emit,
  ) async {
    emit(state.copyWith(filterMonth: event.month, filterYear: event.year));
    add(const GetWinnersEvent());
  }
}
