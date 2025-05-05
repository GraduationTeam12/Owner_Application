 
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutError extends LogoutState {
  final String errorMessage;

  LogoutError({required this.errorMessage});
}

final class LogoutSuccessState extends LogoutState {}
