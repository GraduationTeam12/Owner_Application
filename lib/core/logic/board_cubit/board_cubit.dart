// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/api/end_points.dart';
import 'package:user_app/core/cache/cache_helper.dart';
import 'package:user_app/core/data/repo/auth_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(
    this.authRepository,
  ) : super(BoardInitial());
  final AuthRepository authRepository;
  IO.Socket? socket;

  void getBoardData() async {
    emit(BoardLoading());

    final res = await authRepository.getBoardData();

    res.fold((l) => emit(BoardError(message: l)),
        (r) => emit(BoardSuccess(  res: r)));
  }

   void connectToSocket() {
  try {
    final token = CacheHelper().getData(key: ApiKeys.token); 
    
    socket = IO.io('https://satars.onrender.com/user-sensors', 
      IO.OptionBuilder()
        .setTransports(['websocket'])
        .setExtraHeaders({'Authorization': 'Bearer $token'}) 
        .disableAutoConnect() 
        .build(),
    );

    socket!.connect(); 

    socket!.onConnect((_) {
      print('🔗 Connected to WebSocket Server');
    });

    socket!.on('board-data-updated', (data) {
      print("📩 Received updated data: $data");
      emit(BoardSuccess(res: data));
    });

    socket!.onDisconnect((_) {
      print('❌ Disconnected from WebSocket Server');
    });

  } catch (e) {
    print('❌ Error in WebSocket: $e');
  }
}

  @override
  Future<void> close() {
    socket?.disconnect();
    socket?.dispose();
    return super.close();
  }

}
