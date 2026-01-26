import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends BaseBloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<GetNotificationsEvent>(_getNotifications);
    on<RefreshNotificationsEvent>(_refreshNotifications);
    on<MarkNotificationReadEvent>(_markNotificationRead);
    on<MarkAllNotificationsReadEvent>(_markAllNotificationsRead);
    on<DeleteNotificationEvent>(_deleteNotification);
  }

  Future<void> _getNotifications(
    GetNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // TODO: Replace with actual API call when ready
      // await handleApiCall<List<NotificationModel>>(
      //   emit: emit,
      //   apiCall: () => _api.getNotifications(),
      //   loadingState: () => state.copyWith(isLoading: true),
      //   successState: (notifications) => state.copyWith(
      //     isLoading: false,
      //     isSuccess: true,
      //     notifications: notifications,
      //     unreadCount: notifications.where((n) => !n.isRead).length,
      //   ),
      //   errorState: (error) => state.copyWith(
      //     isLoading: false,
      //     isError: true,
      //     errorMessage: error,
      //   ),
      //   defaultErrorMessage: 'فشل تحميل الإشعارات',
      // );

      // Using mock data for now
      await Future.delayed(const Duration(milliseconds: 300));
      final notifications = NotificationModel.getMockNotifications();

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        notifications: notifications,
        unreadCount: notifications.where((n) => !n.isRead).length,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _refreshNotifications(
    RefreshNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    add(const GetNotificationsEvent());
  }

  Future<void> _markNotificationRead(
    MarkNotificationReadEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == event.notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      unreadCount: updatedNotifications.where((n) => !n.isRead).length,
    ));

    // TODO: Sync with API
  }

  Future<void> _markAllNotificationsRead(
    MarkAllNotificationsReadEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    final updatedNotifications = state.notifications
        .map((notification) => notification.copyWith(isRead: true))
        .toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      unreadCount: 0,
    ));

    // TODO: Sync with API
  }

  Future<void> _deleteNotification(
    DeleteNotificationEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    final updatedNotifications = state.notifications
        .where((notification) => notification.id != event.notificationId)
        .toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      unreadCount: updatedNotifications.where((n) => !n.isRead).length,
    ));

    // TODO: Sync with API
  }
}
