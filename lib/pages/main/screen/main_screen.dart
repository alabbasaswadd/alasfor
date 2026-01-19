import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/app_bar_search_field.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:alasfor/core/widgets/stories_section.dart';
import 'package:alasfor/pages/home/screen/home_screen.dart';
import 'package:alasfor/pages/new_products/screen/new_products_screen.dart';
import 'package:alasfor/pages/scanner/screen/scanner_screen.dart';
import 'package:alasfor/pages/winners/screen/winners_screen.dart';
import 'package:flutter/material.dart';

/// Main screen of the application with custom wave AppBar
/// and curved bottom navigation bar.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  // Pages for each navigation tab
  final List<Widget> _pages = [
    _ProfilePage(),
    WinnersScreen(),
    HomeScreen(),
    NewProductsScreen(),
    ScannerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Show stories in app bar only on home tab (index 2)
    final bool isHomeTab = _currentIndex == 2;
    // Show search field in app bar only on new products tab (index 3)
    final bool isNewProductsTab = _currentIndex == 3;

    // Determine child widget for app bar based on current tab
    Widget? appBarChild;
    if (isHomeTab) {
      appBarChild = const StoriesSection();
    } else if (isNewProductsTab) {
      appBarChild = const AppBarSearchField();
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(child: appBarChild),
      body: IndexedStack(index: _currentIndex, children: _pages),
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

/// Profile page placeholder
class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return _buildPageContent(
      icon: Icons.person,
      title: 'الملف الشخصي',
      subtitle: 'عرض وتعديل معلوماتك الشخصية',
    );
  }
}

/// Helper function to build page content
Widget _buildPageContent({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 60, color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        AppText.large(
          title,
          color: AppColors.darkGray,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: AppText.medium(
            subtitle,
            textAlign: TextAlign.center,
            color: AppColors.darkGray.withOpacity(0.7),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    ),
  );
}
