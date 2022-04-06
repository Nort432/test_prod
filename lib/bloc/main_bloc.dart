import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

/// MainBloc
class MainBloc extends Bloc<MainEvent, MainState> {
  /// Constructor MainBloc
  MainBloc() : super(MainInitial(Colors.white)) {
    on<MainChangeBackgroundColorEvent>(_changeBackgroundColor);
  }

  FutureOr<void> _changeBackgroundColor(
    MainChangeBackgroundColorEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(MainLoading());

    try {
      final Random rnd = Random();

      final int red = rnd.nextInt(255);
      final int green = rnd.nextInt(255);
      final int blue = rnd.nextInt(255);

      if (green > 200) {
        throw Exception('Custom error');
      }

      final Color newBackgroundColor = Color.fromRGBO(red, green, blue, 1);

      await Future<dynamic>.delayed(const Duration(seconds: 1));

      return emit(MainLoaded(newBackgroundColor));
    } on Exception catch (e) {
      return emit(MainError(e));
    }
  }
}
