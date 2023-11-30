import 'package:flutter/material.dart';

typedef OnTextChanged = void Function(String);

class SearchField extends StatelessWidget {
  final OnTextChanged? onTextChanged;

  const SearchField({
    this.onTextChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextField(
      onChanged: onTextChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        hintText: 'Search in Barbers, Location and services ...',
        suffixIcon: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: themeData.primaryColor,
          ),
          margin: EdgeInsets.only(right: 6),
          child: Icon(Icons.search),
        ),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 48,
          maxHeight: 48,
        ),
        hintStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
