import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.title,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(title),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFFAA935F) : Colors.transparent,
        minimumSize: Size(30, 33),
      ),
    );
  }
}
