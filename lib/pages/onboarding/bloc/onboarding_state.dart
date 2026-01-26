import 'package:alasfor/core/constants/app_images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    @Default(0) int currentPage,
    @Default([]) List<OnboardingContent> pages,
    @Default(false) bool shouldNavigateToMain,
  }) = _OnboardingState;
}

class OnboardingContent {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingContent({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  static List<OnboardingContent> getPages() {
    return [
      OnboardingContent(
        title: 'من هنا تبدأ رحلتك مع منتجات\nالعصفور',
        subtitle: 'جودة نعرفها، ونشاركها معك بكل ثقة.',
        imagePath: AppImages.camolino2,
      ),
      OnboardingContent(
        title: 'اكتشف مجموعة واسعة من\nالمنتجات',
        subtitle: 'منتجات طازجة وعالية الجودة في متناول يدك.',
        imagePath: AppImages.camolino2,
      ),
      OnboardingContent(
        title: 'تسوق بسهولة واحصل على\nأفضل العروض',
        subtitle: 'توصيل سريع وآمن إلى باب منزلك.',
        imagePath: 'assets/images/product3.png',
      ),
    ];
  }
}
