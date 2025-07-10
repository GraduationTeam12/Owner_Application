import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/api/dio_consumer.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/core/logic/login_cubit/login_cubit.dart';
import 'package:user_app/presentation/screens/owner_screens/sign_in_screen.dart';

part 'update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit(this.authRepo) : super(UpdateInfoInitial());
  final AuthRepository authRepo;

  String userName = CacheHelper().getData(key: 'userName');
  String userAddress = CacheHelper().getData(key: 'address');

  Future<void> updateInfo({
    required String name,
    required String address,
  }) async {
    emit(UpdateInfoLoading());

    final result = await authRepo.updateUserInfo(
      name,
      address,
    );
    result.fold(
      (l) => emit(UpdateInfoError(errMsg: l)),
      (r) async{
          
        await CacheHelper().saveData(key: 'userName', value: name);
        await CacheHelper().saveData(key: 'address', value: address);

        userName =  name;
          userAddress = address;
        emit(UpdateInfoSuccess(message: r));
      },
    );
  }
// Timer? _checkUserTimer;

// void startUserCheckTimer(BuildContext context) {
//   _checkUserTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
//     print('🔄 Checking if user still exists...');
//     await _checkIfUserStillExists(context);
//   });
// }

// Future<void> _checkIfUserStillExists(BuildContext context) async {
//   try {
//     final token = CacheHelper().getData(key: ApiKeys.token);

//     final response = await Dio().get(
//       'https://api.satars.site/api/v1/users/contacts',
//       options: Options(
//         headers: {'Authorization': 'Bearer $token'},
//       ),
//     );

//     // الحساب موجود، لا حاجة لفعل شيء
//     print('✅ User still exists');

//   } on DioException catch (e) {
//     if (e.response?.statusCode == 401 &&
//         e.response?.data['msg'] == 'User not found or unauthorized') {
//       print('🚫 User deleted or unauthorized');

//       await CacheHelper().clear();
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//             builder: (_) => BlocProvider(
//                   create: (BuildContext context) => LoginCubit(
//                       AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
//                   child: const SignInScreen(),
//                 )), (route) => false);
//     } else {
//       print('❌ Unexpected error: ${e.message}');
//     }
//   }
// }
// @override
// Future<void> close() {
//   _checkUserTimer?.cancel();

//   return super.close();
// }


}
