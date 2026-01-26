import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:alasfor/core/constants/app_colors.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<NotificationModel> notifications,
    @Default(0) int unreadCount,
  }) = _NotificationsState;
}

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final Color borderColor;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.borderColor,
    this.isRead = false,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    IconData? icon,
    Color? iconColor,
    Color? iconBackground,
    Color? borderColor,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      iconBackground: iconBackground ?? this.iconBackground,
      borderColor: borderColor ?? this.borderColor,
      isRead: isRead ?? this.isRead,
    );
  }

  // Mock data for testing
  static List<NotificationModel> getMockNotifications() {
    return [
      NotificationModel(
        id: '1',
        title: 'إعلان فائز جديد',
        description:
            'تم الإعلان عن الفائز في السحب الشهري الأخير بشكل رسمي. '
            'للاطلاع على التفاصيل في صفحة الرابحين.',
        time: 'منذ دقيقتين',
        icon: Icons.emoji_events,
        iconColor: AppColors.secondary,
        iconBackground: AppColors.secondary.withOpacity(0.1),
        borderColor: AppColors.secondaryDark,
      ),
      NotificationModel(
        id: '2',
        title: 'حملة QR جديدة',
        description: 'حملة مسح جديدة انطلقت، اجمع الرموز وادخل السحب القادم.',
        time: 'منذ 5 دقائق',
        icon: Icons.qr_code_2,
        iconColor: AppColors.purpleBorder,
        iconBackground: AppColors.purpleLight,
        borderColor: AppColors.purpleBorder,
      ),
      NotificationModel(
        id: '3',
        title: 'نتائج هذا الشهر',
        description: 'قائمة الفائزين لهذا الشهر أصبحت متاحة بكل شفافية.',
        time: 'منذ 30 دقائق',
        icon: Icons.emoji_events_outlined,
        iconColor: AppColors.blueBorder,
        iconBackground: AppColors.blueLight,
        borderColor: AppColors.blueBorder,
      ),
      NotificationModel(
        id: '4',
        title: 'منتج جديد',
        description: 'تمت إضافة منتج جديد من مواد العصفور اكتشفه الآن.',
        time: 'أمس',
        icon: Icons.shopping_bag_outlined,
        iconColor: AppColors.greenBorder,
        iconBackground: AppColors.greenLight,
        borderColor: AppColors.yellowBorder,
      ),
      NotificationModel(
        id: '5',
        title: 'تحديث مهم',
        description:
            'تم تحديث محتوى التطبيق بمواد وخدمات جديدة، تجربة أفضل بانتظارك.',
        time: 'أمس',
        icon: Icons.update,
        iconColor: AppColors.redBorder,
        iconBackground: AppColors.redLight.withOpacity(0.1),
        borderColor: AppColors.redBorder,
      ),
    ];
  }
}
