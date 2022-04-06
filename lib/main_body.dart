import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_prod/bloc/main_bloc.dart';

/// Main body
class MainBody extends StatelessWidget {
  /// Constructor of MainBody
  const MainBody({
    this.newBackgoundColor = Colors.white,
    this.text,
    Key? key,
  }) : super(key: key);

  /// Background color of the screen
  final Color newBackgoundColor;

  /// Text in the center of the screen
  final String? text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: newBackgoundColor,
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          context.read<MainBloc>().add(MainChangeBackgroundColorEvent());
        },
        child: Scaffold(
          body: Center(
            child: Text(text ?? 'Hey there'),
          ),
        ),
      ),
    );
  }
}
