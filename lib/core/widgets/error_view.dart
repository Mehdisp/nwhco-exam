
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback? onTryAgainPressed;

  const ErrorView({
    this.onTryAgainPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off_rounded, size: 56),
          const SizedBox(height: 16),
          Text('Get Barbers Error!'),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: onTryAgainPressed,
            icon: Icon(Icons.refresh_rounded),
            label: Text('Try again'),
          ),
        ],
      ),
    );
  }
}