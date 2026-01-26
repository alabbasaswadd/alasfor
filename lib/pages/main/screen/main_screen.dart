import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/app_bar_search_field.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:alasfor/core/widgets/stories_section.dart';
import 'package:alasfor/pages/home/screen/home_screen.dart';
import 'package:alasfor/pages/main/bloc/main_bloc.dart';
import 'package:alasfor/pages/main/bloc/main_event.dart';
import 'package:alasfor/pages/main/bloc/main_state.dart';
import 'package:alasfor/pages/new_products/screen/new_products_screen.dart';
import 'package:alasfor/pages/scanner/screen/scanner_screen.dart';
import 'package:alasfor/pages/winners/screen/winners_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main screen of the application with custom wave AppBar
/// and curved bottom navigation bar.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String id = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc _bloc;

  // Pages for each navigation tab
  final List<Widget> _pages = [
    const _ProfilePage(),
    const WinnersScreen(),
    const HomeScreen(),
    const NewProductsScreen(),
    const ScannerScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _bloc = MainBloc();
    _bloc.add(const InitMainEvent());
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
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          // Determine child widget for app bar based on current tab
          Widget? appBarChild;
          if (state.isHomeTab) {
            appBarChild = const StoriesSection();
          } else if (state.isNewProductsTab) {
            appBarChild = const AppBarSearchField();
          }

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBar(child: appBarChild),
            body: IndexedStack(index: state.currentIndex, children: _pages),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                _bloc.add(ChangeTabEvent(index));
              },
            ),
          );
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
