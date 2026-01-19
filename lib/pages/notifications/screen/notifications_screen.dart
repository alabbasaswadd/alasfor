import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 0;

  final List<NotificationItem> _notifications = [
    NotificationItem(
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
    NotificationItem(
      title: 'حملة QR جديدة',
      description: 'حملة مسح جديدة انطلقت، اجمع الرموز وادخل السحب القادم.',
      time: 'منذ 5 دقائق',
      icon: Icons.qr_code_2,
      iconColor: AppColors.purpleBorder,
      iconBackground: AppColors.purpleLight,
      borderColor: AppColors.purpleBorder,
    ),
    NotificationItem(
      title: 'نتائج هذا الشهر',
      description: 'قائمة الفائزين لهذا الشهر أصبحت متاحة بكل شفافية.',
      time: 'منذ 30 دقائق',
      icon: Icons.emoji_events_outlined,
      iconColor: AppColors.blueBorder,
      iconBackground: AppColors.blueLight,
      borderColor: AppColors.blueBorder,
    ),
    NotificationItem(
      title: 'منتج جديد',
      description: 'تمت إضافة منتج جديد من مواد العصفور اكتشفه الآن.',
      time: 'أمس',
      icon: Icons.shopping_bag_outlined,
      iconColor: AppColors.greenBorder,
      iconBackground: AppColors.greenLight,
      borderColor: AppColors.yellowBorder,
    ),
    NotificationItem(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText.xlarge('الإشعارات'),
            AppText.body(
              'ابق على اطلاع دائم بأهم المستجدات',
              color: AppColors.textSecondary,
            ),

            // Notifications List
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _notifications.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return notificationCard(_notifications[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

Widget notificationCard(NotificationItem notification) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.pink,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: notification.iconColor, offset: Offset(3, 0)),
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

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Title and Time
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

                // Description
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
  );
}

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final Color borderColor;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.borderColor,
  });
}
