part of 'closest_members_cubit.dart';

sealed class ClosestMembersState  {
  const ClosestMembersState();

}

final class ClosestMembersInitial extends ClosestMembersState {}

final class AddClosestMembersLoading extends ClosestMembersState {}
final class AddClosestMembersError extends ClosestMembersState {
  final String error;

  const AddClosestMembersError(this.error);
}
final class AddClosestMembersSuccess extends ClosestMembersState {
  final String message;

  const AddClosestMembersSuccess(this.message);
}

final class ClosestMembersLoading extends ClosestMembersState {}
final class ClosestMembersError extends ClosestMembersState {
  final String error;

  const ClosestMembersError(this.error);
}
final class ClosestMembersSuccess extends ClosestMembersState {
  final List<ClosestPersonModel> closestMembers;

  const ClosestMembersSuccess(this.closestMembers);
}
