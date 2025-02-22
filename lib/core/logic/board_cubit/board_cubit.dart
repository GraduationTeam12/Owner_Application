// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(
    this.authRepository,
  ) : super(BoardInitial());
  final AuthRepository authRepository;

  void getBoardData() async {
    emit(BoardLoading());

    final res = await authRepository.getBoardData();

    res.fold((l) => emit(BoardError(message: l)),
        (r) => emit(BoardSuccess(  res: r)));
  }
}
