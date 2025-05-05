part of 'update_info_cubit.dart';

sealed class UpdateInfoState   {
  const UpdateInfoState();
}

final class UpdateInfoInitial extends UpdateInfoState {}

final class UpdateInfoLoading extends UpdateInfoState {}

final class UpdateInfoSuccess extends UpdateInfoState {
  final String message;

  const UpdateInfoSuccess({required this.message});
}

final class UpdateInfoError extends UpdateInfoState {
  final String errMsg;

  const UpdateInfoError({required this.errMsg});
}
