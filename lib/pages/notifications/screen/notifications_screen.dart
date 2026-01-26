import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:alasfor/pages/notifications/bloc/notifications_bloc.dart';
import 'package:alasfor/pages/notifications/bloc/notifications_event.dart';
import 'package:alasfor/pages/notifications/bloc/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  static const String id = '/notifications';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late NotificationsBloc _bloc;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _bloc = NotificationsBloc();
    _bloc.add(const GetNotificationsEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(state.errorMessage),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _bloc.add(const GetNotificationsEvent()),
                      child: const AppText.body('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            if (state.notifications.isEmpty) {
              return const Center(
                child: AppText.medium('لا توجد إشعارات'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                _bloc.add(const RefreshNotificationsEvent());
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.xlarge('الإشعارات'),
                    AppText.body(
                      'ابق على اطلاع دائم بأهم المستجدات',
                      color: AppColors.textSecondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.notifications.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _buildNotificationCard(
                            state.notifications[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    return GestureDetector(
      onTap: () {
        if (!notification.isRead) {
          _bloc.add(MarkNotificationReadEvent(notification.id));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: notification.isRead
              ? AppColors.pink.withOpacity(0.5)
              : AppColors.pink,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: notification.iconColor, offset: const Offset(3, 0)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: notification.iconBackground,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: AppText.medium(
                            notification.title,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        AppText.small(
                          notification.time,
                          color: AppColors.textLight,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    AppText.custom(
                      notification.description,
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.5,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
