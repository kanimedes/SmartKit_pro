import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/features/style/theme/appTheme.dart';

class ThemeState {
  final AppTheme appTheme;
  ThemeState(this.appTheme);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(getAppThemeFromLabel("light")));

  static AppTheme getAppThemeFromLabel(String label) {
    if (label == "darkTheme") {
      return AppTheme.Dark;
    }
    return AppTheme.Light;
  }
}
