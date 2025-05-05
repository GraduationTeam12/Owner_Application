import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';

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
}
