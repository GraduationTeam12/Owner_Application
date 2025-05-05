 
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/data/model/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()) {
    loadNotifications(); // تحميل الإشعارات عند إنشاء الكيوبت
  }

  final List<NotificationModel> _notifications = [
    NotificationModel(
      title: 'Congratulation',
      subject: "The car is in perfect condition",
      pathIconImage: "assets/images/auth_images/notification_congr.png",
      backgroundCard: Color.fromRGBO(227, 242, 231, 1),
      borderColor: Color.fromRGBO(0, 128, 0, 0.4),
      backgroundIcon: Color.fromRGBO(0, 128, 0, 1),
    ),
    NotificationModel(
      title: 'Do you know?',
      subject: "There is a new update for the App",
      pathIconImage: "assets/images/auth_images/notification_know.png",
      backgroundCard: Color.fromRGBO(231, 239, 250, 1),
      borderColor: Color.fromRGBO(190, 208, 232, 1),
      backgroundIcon: Color.fromRGBO(93, 150, 217, 1),
    ),
    NotificationModel(
      title: 'Warning',
      subject: "Warning in car condition",
      pathIconImage: "assets/images/auth_images/notification_warning.png",
      backgroundCard: Color.fromRGBO(255, 249, 237, 1),
      borderColor: Color.fromRGBO(236, 222, 195, 1),
      backgroundIcon: Color.fromRGBO(240, 189, 61, 1),
    ),
    NotificationModel(
      title: 'Something Went Wrong',
      subject: "There is a problem in the knock sensor",
      pathIconImage: "assets/images/auth_images/notification_error.png",
      backgroundCard: Color.fromRGBO(252, 238, 235, 1),
      borderColor: Color.fromRGBO(233, 199, 190, 1),
      backgroundIcon: Color.fromRGBO(249, 86, 85, 1),
    ),
  ];

  void loadNotifications() {
    emit(NotificationInitial()); // إعادة الحالة الابتدائية
    emit(NotificationLoaded(List.of(_notifications), _notifications.length));
  }

  void removeNotification(int index) {
    if (index >= 0 && index < _notifications.length) {
      _notifications.removeAt(index);
      emit(NotificationLoaded(List.of(_notifications), _notifications.length));
    }
  }
}
