part of 'board_cubit.dart';

sealed class BoardState {}

final class BoardInitial extends BoardState {}

final class BoardLoading extends BoardState {}

final class BoardSuccess extends BoardState {
  dynamic res;
  BoardSuccess({required this.res});
}

final class BoardError extends BoardState {
  String message;
  BoardError({required this.message});
}
