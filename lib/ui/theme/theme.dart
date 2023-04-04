import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartkit_pro/ui/theme/colors.dart';

class ThemeAndRTLState {
  final ThemeData theme;
  final TextDirection textDirection;

  ThemeAndRTLState(this.theme, this.textDirection);
}

class ThemeAndRTLCubit extends Cubit<ThemeAndRTLState> {
  ThemeAndRTLCubit()
      : super(
          ThemeAndRTLState(
            ThemeData(
              colorScheme: ColorScheme.light(
                onBackground: const Color(0xff46536d),
                secondary: const Color(0xfff1f6fa),
                onSecondary: const Color(0xff7d8698),
                background: Colors.white,
                surface: Colors.white,
                onSurface: const Color(0xffF7F9FC),
                primary: colorThemes.first.primaryColor,
                primaryContainer: colorThemes.first.darkPrimaryColor,
              ),
            ),
            TextDirection.ltr,
          ),
        );

  void changeTheme(ColorTheme colorTheme) {
    final currentTheme = state.theme;
    final currentTextDirection = state.textDirection;
    emit(ThemeAndRTLState(
        currentTheme.copyWith(
            colorScheme: currentTheme.colorScheme.copyWith(
          primary: colorTheme.primaryColor,
          primaryContainer: colorTheme.darkPrimaryColor,
        )),
        currentTextDirection));
  }

  void changeTextDirection(TextDirection textDirection) {
    final currentTheme = state.theme;
    emit(ThemeAndRTLState(currentTheme, textDirection));
  }
}
