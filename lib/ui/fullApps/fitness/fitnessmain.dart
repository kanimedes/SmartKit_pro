import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/features/style/theme/appTheme.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/features/style/theme/themeCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class Fitnessmain extends StatefulWidget {
  const Fitnessmain({Key? key}) : super(key: key);

  @override
  State<Fitnessmain> createState() => _FitnessmainState();
}

class _FitnessmainState extends State<Fitnessmain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final currenttheme = context.watch<ThemeCubit>().state.appTheme;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThemeData[currenttheme],
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.onGenetate,
          );
        },
      ),
    );
  }
}
