import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget loading
class MyLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: Colors.redAccent,
        // radius: 15,
      ),
    );
  }
}
