import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class NotificationsEvent extends BaseEvent {
  const NotificationsEvent();
}

class GetNotificationsEvent extends NotificationsEvent {
  const GetNotificationsEvent();
}

class RefreshNotificationsEvent extends NotificationsEvent {
  const RefreshNotificationsEvent();
}

class MarkNotificationReadEvent extends NotificationsEvent {
  final String notificationId;
  const MarkNotificationReadEvent(this.notificationId);
}

class MarkAllNotificationsReadEvent extends NotificationsEvent {
  const MarkAllNotificationsReadEvent();
}

class DeleteNotificationEvent extends NotificationsEvent {
  final String notificationId;
  const DeleteNotificationEvent(this.notificationId);
}
