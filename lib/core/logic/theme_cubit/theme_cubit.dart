import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isDark = false;


  void changeTheme(BuildContext context) async {
    isDark = !isDark;
    await CacheHelper().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
    Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen(index: 3,),));
  }

  void getTheme() async {
    var themeData = await CacheHelper().getData(key: 'isDark');
    
    if (themeData == null) {
      isDark = false;
      await CacheHelper().saveData(key: 'isDark', value: false);
      
    } else {
      isDark = themeData;
    }
    
    emit(GetThemeState());
  }
}
