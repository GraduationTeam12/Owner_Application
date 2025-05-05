import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/data/model/closest_people_model.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';

part 'closest_members_state.dart';

class ClosestMembersCubit extends Cubit<ClosestMembersState> {
  ClosestMembersCubit(this.repo) : super(ClosestMembersInitial());

  final AuthRepository repo;
  Future<void> addEmergencyContacts(
    String name1, String phone1, String name2, String phone2
  ) async {
    emit(AddClosestMembersLoading());
      final res = await repo.addEmergencyContacts(
        name1, phone1, name2, phone2
      );
      res.fold(
        (l) => emit(AddClosestMembersError(l)),
        (r) => emit(AddClosestMembersSuccess(r)),
      );
     
  }

  Future<void> getClosestMembers() async {
    emit(ClosestMembersLoading());
    final res = await repo.getEmergencyContacts();
    res.fold(
      (l) => emit(ClosestMembersError(l)),
      (r) => emit(ClosestMembersSuccess(r)),
    );
  }
}
