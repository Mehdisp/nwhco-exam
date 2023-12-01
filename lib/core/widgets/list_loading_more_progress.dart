import 'package:flutter/material.dart';

class ListLoadingMoreProgress extends StatelessWidget {
  const ListLoadingMoreProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
  }
}