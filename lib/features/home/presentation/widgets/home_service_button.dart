import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeServiceButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const HomeServiceButton({
    required this.iconPath,
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 45,
            alignment: Alignment.center,
            child: SvgPicture.asset(iconPath),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF808A9E),
            ),
          ),
        ],
      ),
    );
  }
}
