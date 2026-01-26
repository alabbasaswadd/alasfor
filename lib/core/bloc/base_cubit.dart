import 'dart:async';
import 'package:alasfor/core/helper/handle_api.dart';
import 'package:alasfor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  final Map<String, Timer> _debounceTimers = {};
  final Map<String, DateTime> _throttleTimestamps = {};
  bool _isLoadingDialogVisible = false;

  // ============== Error Handling ==============

  @override
  void onError(Object error, StackTrace stackTrace) {
    handleError(error, stackTrace);
    super.onError(error, stackTrace);
  }

  void handleError(Object error, StackTrace stackTrace) {
    showErrorSnackBar(errorMessageForCubit(error));
  }

  String errorMessageForCubit(Object error) {
    return 'حدث خطأ في ${runtimeType}: ${parseError(error)}';
  }

  String parseError(Object error) {
    if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return error.toString();
  }

  // ============== UI Feedback ==============

  BuildContext? get _context => navigatorKey.currentContext;

  void showErrorSnackBar(String message) {
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void showSuccessSnackBar(String message) {
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void showInfoSnackBar(String message) {
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void showLoadingDialog({String? message}) {
    if (_context != null && !_isLoadingDialogVisible) {
      _isLoadingDialogVisible = true;
      showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false,
          child: AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Text(message ?? 'جاري التحميل...'),
              ],
            ),
          ),
        ),
      );
    }
  }

  void hideLoadingDialog() {
    if (_context != null && _isLoadingDialogVisible) {
      Navigator.of(_context!).pop();
      _isLoadingDialogVisible = false;
    }
  }

  // ============== Navigation ==============

  void navigateTo(String routeName, {Object? arguments}) {
    if (_context != null) {
      Navigator.of(_context!).pushNamed(routeName, arguments: arguments);
    }
  }

  void navigateAndReplace(String routeName, {Object? arguments}) {
    if (_context != null) {
      Navigator.of(_context!)
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  void navigateAndClearStack(String routeName, {Object? arguments}) {
    if (_context != null) {
      Navigator.of(_context!).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }
  }

  void goBack([dynamic result]) {
    if (_context != null) {
      Navigator.of(_context!).pop(result);
    }
  }

  // ============== Debounce & Throttle ==============

  void debounce(
    String key,
    VoidCallback action, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    _debounceTimers[key]?.cancel();
    _debounceTimers[key] = Timer(duration, action);
  }

  bool throttle(
    String key, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    final now = DateTime.now();
    final lastTime = _throttleTimestamps[key];

    if (lastTime == null || now.difference(lastTime) > duration) {
      _throttleTimestamps[key] = now;
      return true;
    }
    return false;
  }

  // ============== Safe Execution ==============

  Future<void> safeCall<T>({
    required Future<T> Function() call,
    required void Function(T result) onSuccess,
    required void Function(String error) onError,
    void Function()? onLoading,
  }) async {
    try {
      onLoading?.call();
      final result = await call();
      onSuccess(result);
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      onError(parseError(e));
    }
  }

  // ============== API Handling ==============

  Future<void> handleApiCall<T>({
    required Future<dynamic> Function() apiCall,
    required S Function() loadingState,
    required S Function(T data) successState,
    required S Function(String error) errorState,
    T Function(dynamic data)? dataParser,
    String defaultErrorMessage = 'حدث خطأ غير متوقع',
    bool showLoading = false,
    bool showSuccessMessage = false,
    String? successMessage,
  }) async {
    if (showLoading) showLoadingDialog();
    emit(loadingState());

    try {
      final response = await apiCall();

      if (showLoading) hideLoadingDialog();

      if (HandleApi.isSuccess(response)) {
        final data = dataParser != null
            ? dataParser(response.data)
            : response.data as T;
        emit(successState(data));
        if (showSuccessMessage && successMessage != null) {
          showSuccessSnackBar(successMessage);
        }
      } else {
        final errorMsg = HandleApi.parseErrors(
          response.data,
          defaultMessage: defaultErrorMessage,
        );
        emit(errorState(errorMsg));
      }
    } catch (e, stackTrace) {
      if (showLoading) hideLoadingDialog();
      addError(e, stackTrace);
      emit(errorState(parseError(e)));
    }
  }

  // ============== Lifecycle ==============

  @override
  Future<void> close() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    _debounceTimers.clear();
    _throttleTimestamps.clear();
    return super.close();
  }
}
