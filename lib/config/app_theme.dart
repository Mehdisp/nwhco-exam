import 'package:flutter/material.dart';

class AppTheme {
  static final _primaryColor = Colors.orange;
  static final _secondaryColor = Colors.yellow;

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
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData light() {
    return _baseTheme.copyWith(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),
      dividerTheme: _baseTheme.dividerTheme.copyWith(
        color: Colors.grey.shade200,
      ),
      inputDecorationTheme: _baseTheme.inputDecorationTheme.copyWith(
        fillColor: Colors.grey.shade200,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return _baseTheme.copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),
      dividerTheme: _baseTheme.dividerTheme.copyWith(
        color: Colors.white12,
      ),
      inputDecorationTheme: _baseTheme.inputDecorationTheme.copyWith(
        fillColor: Colors.grey.shade800,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
