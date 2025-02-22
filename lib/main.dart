import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/app_constants.dart';
import 'package:user_app/constants/app_theme_data.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/logic/logout_cubit/logout_cubit.dart';
import 'package:user_app/core/logic/theme_cubit/theme_cubit.dart';
import 'package:user_app/firebase_options.dart';
import 'package:user_app/generated/codegen_loader.g.dart';
import 'package:user_app/presentation/screens/owner_screens/add_members_screen.dart';
import 'package:user_app/presentation/widgets/get_fcmtoken.dart';
import 'package:user_app/routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  await EasyLocalization.ensureInitialized();
  // The application works in portrait orientation only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.wait([
    PushNotificationsService.init(),
    AddMembersScreenState.init(),
  ]);
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..getTheme(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path:
            'assets/translations', // <-- change the path of the translation files
        // fallbackLocale: Locale('ar'),
        startLocale: Locale(AppConstants.lang),
        assetLoader: CodegenLoader(),
        child: MyApp(
          appRouter: AppRouter(),
        ),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  final token = CacheHelper().getData(key: ApiKeys.token);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'SATARS',
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: BlocProvider.of<ThemeCubit>(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          onGenerateRoute: appRouter.generationRoute,
          initialRoute: token == null ? splashScreen : homePageScreen,
          // initialRoute: sensorsScreen,
        );
      },
    );
  }
}
