part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;
  final int count; // إضافة عدد الإشعارات

  const NotificationLoaded(this.notifications, this.count);

  @override
  List<Object> get props => [notifications, count];
}
