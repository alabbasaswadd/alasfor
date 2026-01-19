import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import 'clippers/wave_clipper.dart';

/// A custom AppBar with a wave-shaped bottom edge.
///
/// This widget implements [PreferredSizeWidget] so it can be used
/// directly as the `appBar` property of a [Scaffold].
///
/// Features:
/// - Wave-shaped bottom using [CustomClipper]
/// - Support for gradient backgrounds
/// - Dynamic title support
/// - Optional leading and action widgets
/// - SafeArea compliance
/// - Responsive design
class CustomWaveAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title displayed in the center of the AppBar.
  /// Can be a String or a custom Widget.
  final dynamic title;

  /// Widget displayed on the left side of the AppBar.
  final Widget? leading;

  /// List of widgets displayed on the right side of the AppBar.
  final List<Widget>? actions;

  /// Whether to center the title.
  final bool centerTitle;

  /// Background color of the AppBar.
  /// If [gradient] is provided, this is ignored.
  final Color? backgroundColor;

  /// Optional gradient for the AppBar background.
  final Gradient? gradient;

  /// Height of the wave at the bottom.
  final double waveHeight;

  /// Total height of the AppBar including the wave.
  final double height;

  /// The type of wave clipper to use.
  final WaveType waveType;

  /// System UI overlay style for status bar.
  final SystemUiOverlayStyle? systemOverlayStyle;

  const CustomWaveAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.gradient,
    this.waveHeight = 30.0,
    this.height = 140.0,
    this.waveType = WaveType.smooth,
    this.systemOverlayStyle,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          systemOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
      child: ClipPath(
        child: Container(
          height: height + statusBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: gradient == null ? backgroundColor : null,
            gradient: gradient ?? AppColors.primaryGradient,
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  CustomClipper<Path> _getClipper() {
    switch (waveType) {
      case WaveType.smooth:
        return SmoothWaveClipper(waveDepth: waveHeight);
      case WaveType.wave:
        return WaveClipper(waveHeight: waveHeight);
      case WaveType.multiWave:
        return MultiWaveClipper(waveHeight: waveHeight);
    }
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: [
        // Leading widget
        if (leading != null) leading! else _buildDefaultLeading(context),

        // Title in the center
        Expanded(
          child: centerTitle
              ? Center(child: _buildTitle(context))
              : _buildTitle(context),
        ),

        // Actions
        if (actions != null && actions!.isNotEmpty)
          Row(mainAxisSize: MainAxisSize.min, children: actions!)
        else
          _buildDefaultAction(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (title == null) {
      return _buildDefaultTitle();
    }

    if (title is String) {
      return AppText.custom(
        title as String,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );
    }

    return title as Widget;
  }

  Widget _buildDefaultTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const AppText.body(
            'العصفور',
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        const AppText.caption(
          'AL-SAFOUR',
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
        const AppText.custom(
          'FAMILY FOOD',
          fontSize: 8,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
        ),
      ],
    );
  }

  Widget _buildDefaultLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications_outlined, color: AppColors.white),
      onPressed: () {},
    );
  }

  Widget _buildDefaultAction(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.white,
      child: ClipOval(
        child: Container(
          color: AppColors.lightGray,
          child: const Icon(Icons.person, color: AppColors.darkGray),
        ),
      ),
    );
  }
}

/// Defines the type of wave to use for the AppBar.
enum WaveType {
  /// A smooth single wave curve.
  smooth,

  /// A standard wave with peak and trough.
  wave,

  /// Multiple small waves.
  multiWave,
}
