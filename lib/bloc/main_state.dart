part of 'main_bloc.dart';

/// abstract class BackColorState
abstract class MainState {}

/// Initial state
class MainInitial extends MainState {
  /// Constructor of BackColorInitial
  MainInitial(this.newBackgroundColor);

  /// Color for background
  final Color newBackgroundColor;
}

/// State of Loading
class MainLoading extends MainState {}

/// State of Loaded
class MainLoaded extends MainState {
  /// Constructor of BackColorLoaded
  MainLoaded(this.newBackgroundColor);

  /// New Color for background
  final Color newBackgroundColor;
}

/// State of Error
class MainError extends MainState {
  /// Constructor for MainError
  MainError(this.exception);

  /// Exception of Main Bloc
  final Exception exception;
}
