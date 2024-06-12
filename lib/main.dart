import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_updated/root/theme/theme_cubit.dart';
import 'package:task_reminder_updated/routes/routes.dart';

import 'cache/cache_manager.dart';
import 'constants/app_colors.dart';



void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 // final theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    CacheManager().screenHeight = MediaQuery.sizeOf(context).height; //as we have locked orientation, it won't change
    CacheManager().screenWidth = MediaQuery.sizeOf(context).width;  //as we have locked orientation, it won't change
    return MultiBlocProvider(

      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeData(
              useMaterial3: true,
            colorSchemeSeed: AppColors.primaryColor),
            //theme.toThemeData(Brightness.light),
            darkTheme:ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                colorSchemeSeed: AppColors.primaryColor), //theme.toThemeData(Brightness.dark),
             themeMode: state.themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}



