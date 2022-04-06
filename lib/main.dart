import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_prod/bloc/main_bloc.dart';
import 'package:test_prod/main_body.dart';
import 'package:test_prod/widgets/my_loading.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// First point of app [MyApp]
class MyApp extends StatelessWidget {
  /// Constructor for MyApp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: blocBuilder(context),
    );
  }

  /// Builder for Main Bloc
  Widget blocBuilder(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainInitial) {
          return MainBody(newBackgoundColor: state.newBackgroundColor);
        }

        if (state is MainLoading) {
          return MyLoading();
        }

        if (state is MainLoaded) {
          return MainBody(newBackgoundColor: state.newBackgroundColor);
        }
        if (state is MainError) {
          return MainBody(text: state.exception.toString());
        }

        return const SizedBox();
      },
    );
  }
}
