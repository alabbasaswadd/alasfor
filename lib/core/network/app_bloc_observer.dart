import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/main.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _showErrorSnackBar(_messageForBloc(bloc, error));

    super.onError(bloc, error, stackTrace);
  }

  void _showErrorSnackBar(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  String _messageForBloc(BlocBase bloc, Object error) {
    return 'حدث خطأ في ${bloc.runtimeType} وهو ${error.toString()}';
  }
}
