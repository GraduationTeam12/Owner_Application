import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:user_app/core/logic/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepository) : super(LogoutInitial());

  final AuthRepository authRepository;
  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await authRepository.logout();
    result.fold(
      (l) => emit(LogoutError(
        errorMessage: l,
      )),
      (r) async {
        await CacheHelper().removeData(key: ApiKeys.token);
        await CacheHelper().removeData(key: ApiKeys.id);
        await CacheHelper().removeData(key: 'userName');
        await CacheHelper().removeData(key: 'address');

        emit(LogoutSuccessState());
      },
    );
    emit(LogoutSuccessState());
  }
}
