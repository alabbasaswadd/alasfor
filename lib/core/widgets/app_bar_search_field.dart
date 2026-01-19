import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:flutter/material.dart';

/// A search field widget designed for use in the AppBar
class AppBarSearchField extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const AppBarSearchField({
    super.key,
    this.hintText,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[400], size: 22),
                const SizedBox(width: 12),
                AppText.body(hintText ?? 'ابحث عن منتج'),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.secondary, AppColors.goldDark],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.tune, color: AppColors.white),
          ),
        ), // Spacing on the right
      ],
    );
  }
}
