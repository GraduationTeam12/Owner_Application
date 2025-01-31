// ignore_for_file: body_might_complete_normally_nullable, empty_constructor_bodies

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/core/api/dio_consumer.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_app/core/logic/login_cubit/login_cubit.dart';
import 'package:user_app/presentation/screens/owner_screens/add_members_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/change_password.dart';
import 'package:user_app/presentation/screens/owner_screens/forgot_password_email_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/forgot_password_phone_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/knock_sensor_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/on_boarding.dart';
import 'package:user_app/presentation/screens/owner_screens/owner_car_splash.dart';
import 'package:user_app/presentation/screens/owner_screens/reset_password_emal_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/reset_password_phone_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/sign_in_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/splash_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/temp_sensor_screen.dart';
import 'package:user_app/presentation/screens/owner_screens/water_sensor_screen.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());

      case signInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => LoginCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const SignInScreen(),
                ));

      case forgotPasswordEmailScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const ForgotPasswordEmailScreen(),
                ));

      case forgotPasswordPhoneScreen:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordPhoneScreen());

      case resetPasswordEmailScreen:
        final email = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: ResetPasswordEmailScreen(
                    email: email,
                  ),
                ));

      case resetPasswordPhoneScreen:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordPhoneScreen());

      case changePasswordScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const ChangePassword(),
                ));

      case addMembersScreen:
        return MaterialPageRoute(
            builder: (_) => const  AddMembersScreen());

      case carSplashScreen:
        return MaterialPageRoute(
            builder: (_) => const  OwnerCarSplashScreen());

      case homePageScreen:
        return MaterialPageRoute(
            builder: (_) =>    HomeScreen());

      case knockSensorScreen:
        return MaterialPageRoute(
            builder: (_) => const  KnockSensorScreen());

      case waterSensorScreen:
        return MaterialPageRoute(
            builder: (_) => const  WaterSensorScreen());

      case tempSensorScreen:
        return MaterialPageRoute(
            builder: (_) => const  TempSensorScreen());  
    }
  }
}
