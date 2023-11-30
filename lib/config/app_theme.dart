import 'package:flutter/material.dart';

class AppTheme {
  static final _primaryColor = Color(0xFF6440FE);
  static final _secondaryColor = Color(0xFF6440FE);
  static final _backgroundColor = Color(0xFF1F2A40);

  static ThemeData _baseTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'DMSans',
    dividerTheme: DividerThemeData(
      indent: 16,
      endIndent: 16,
      space: 8,
      thickness: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      constraints: BoxConstraints(minHeight: 48),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
    ),
    buttonTheme: ButtonThemeData(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        side: BorderSide(color: _primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      enableFeedback: true,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData def() {
    return _baseTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _backgroundColor,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
        background: _backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: Colors.white,
      ),
      dividerTheme: _baseTheme.dividerTheme.copyWith(
        color: Colors.grey.shade700,
      ),
      inputDecorationTheme: _baseTheme.inputDecorationTheme.copyWith(
        fillColor: Colors.white,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _backgroundColor,
      ),
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: Colors.white,
      ),
      bottomNavigationBarTheme: _baseTheme.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0xFFC7CDD9),
        selectedItemColor: _backgroundColor,
        selectedIconTheme: IconThemeData(color: _backgroundColor),
        selectedLabelStyle: TextStyle(
          color: _backgroundColor,
          fontSize: 8,
          height: 2,
        ),
      ),
    );
  }
}
