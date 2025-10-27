import 'package:flutter/material.dart';

/// Breakpoints
///
/// - `initial`: 0 - 639px
/// - `sm`: 640px - 767px
/// - `md`: 768px - 1023px
/// - `lg`: 1024px - 1279px
/// - `xl`: 1280px - 1535px
/// - `xxl`: 1536px and above
enum Breakpoint {
  /// - `initial`: 0 - 639px
  initial,

  /// - `sm`: 640px - 767px
  sm,

  /// - `md`: 768px - 1023px
  md,

  /// - `lg`: 1024px - 1279px
  lg,

  /// - `xl`: 1280px - 1535px
  xl,

  /// - `xxl`: 1536px and above
  xxl,
}

class ResponsiveBuilder {
  ResponsiveBuilder._();

  static const double smBreakpoint = 640;
  static const double mdBreakpoint = 768;
  static const double lgBreakpoint = 1024;
  static const double xlBreakpoint = 1280;
  static const double xxlBreakpoint = 1536;

  /// Returns the current breakpoint name based on screen width
  static Breakpoint getBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= xxlBreakpoint) return Breakpoint.xxl;
    if (width >= xlBreakpoint) return Breakpoint.xl;
    if (width >= lgBreakpoint) return Breakpoint.lg;
    if (width >= mdBreakpoint) return Breakpoint.md;
    if (width >= smBreakpoint) return Breakpoint.sm;
    return Breakpoint.initial;
  }

  /// Responsive builder that works similar to Tailwind's responsive utilities
  static Widget responsive({
    required BuildContext context,
    Widget? child, // Default for mobile
    Widget? sm, // >= 640px
    Widget? md, // >= 768px
    Widget? lg, // >= 1024px
    Widget? xl, // >= 1280px
    Widget? xxl, // >= 1536px
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= xxlBreakpoint && xxl != null) return xxl;
    if (width >= xlBreakpoint && xl != null) return xl;
    if (width >= lgBreakpoint && lg != null) return lg;
    if (width >= mdBreakpoint && md != null) return md;
    if (width >= smBreakpoint && sm != null) return sm;
    return child ?? const SizedBox.shrink();
  }

  static Widget onlyAt({
    required BuildContext context,
    required List<Breakpoint> breakpoints,
    required Widget child,
  }) {
    final current = getBreakpoint(context);
    return breakpoints.contains(current) ? child : const SizedBox.shrink();
  }

  /// Helper method to get responsive value similar to Tailwind's utility classes
  static T value<T>({
    required BuildContext context,
    required T initial, // Default for mobile
    T? sm, // >= 640px
    T? md, // >= 768px
    T? lg, // >= 1024px
    T? xl, // >= 1280px
    T? xxl, // >= 1536px
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= xxlBreakpoint && xxl != null) return xxl;
    if (width >= xlBreakpoint && xl != null) return xl;
    if (width >= lgBreakpoint && lg != null) return lg;
    if (width >= mdBreakpoint && md != null) return md;
    if (width >= smBreakpoint && sm != null) return sm;
    return initial;
  }

  // ---------------------------
  // 🔹 Padding Responsive Helpers
  // ---------------------------

  /// Returns responsive padding that scales with screen size
  static EdgeInsets padding(
    BuildContext context, {
    EdgeInsets initial = const EdgeInsets.all(16),
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
  }) {
    return value<EdgeInsets>(
      context: context,
      initial: initial,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

  /// Returns responsive horizontal padding
  static EdgeInsets horizontalPadding(
    BuildContext context, {
    double initial = 16,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return EdgeInsets.symmetric(
      horizontal: value<double>(
        context: context,
        initial: initial,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      ),
    );
  }

  /// Returns responsive vertical padding
  static EdgeInsets verticalPadding(
    BuildContext context, {
    double initial = 16,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return EdgeInsets.symmetric(
      vertical: value<double>(
        context: context,
        initial: initial,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      ),
    );
  }

  /// Returns responsive all-sides padding
  static EdgeInsets allPadding(
    BuildContext context, {
    double initial = 16,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return EdgeInsets.all(
      value<double>(
        context: context,
        initial: initial,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      ),
    );
  }

  /// Returns responsive page padding (horizontal padding for page content)
  static EdgeInsets pagePadding(BuildContext context) {
    return horizontalPadding(
      context,
      initial: 16,
      sm: 24,
      md: 32,
      lg: 48,
      xl: 64,
      xxl: 80,
    );
  }

  /// Returns responsive section padding (vertical padding between sections)
  static EdgeInsets sectionPadding(BuildContext context) {
    return verticalPadding(
      context,
      initial: 24,
      sm: 32,
      md: 40,
      lg: 48,
      xl: 56,
      xxl: 64,
    );
  }

  // ---------------------------
  // 🔹 Button Responsive Helpers
  // ---------------------------

  /// Returns responsive button width
  static double buttonWidth(
    BuildContext context, {
    double initial = double.infinity,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return value<double>(
      context: context,
      initial: initial,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

  /// Returns responsive button padding (EdgeInsets)
  static EdgeInsets buttonPadding(
    BuildContext context, {
    EdgeInsets initial = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
  }) {
    return value<EdgeInsets>(
      context: context,
      initial: initial,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

  /// Returns responsive button text size
  static double buttonFontSize(
    BuildContext context, {
    double initial = 14,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return value<double>(
      context: context,
      initial: initial,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

  // ---------------------------
  // 🔹 Typography Responsive Helpers
  // ---------------------------

  /// Returns responsive font size with scaling based on screen size
  static double fontSize(
    BuildContext context, {
    required double size,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return value<double>(
      context: context,
      initial: size,
      sm: sm ?? size * 1.05,
      md: md ?? size * 1.1,
      lg: lg ?? size * 1.15,
      xl: xl ?? size * 1.2,
      xxl: xxl ?? size * 1.25,
    );
  }

  /// Returns responsive display large font size (H1)
  static double displayLargeFontSize(BuildContext context) {
    return fontSize(context, size: 64, sm: 68, md: 72, lg: 76, xl: 80, xxl: 84);
  }

  /// Returns responsive display medium font size (H2)
  static double displayMediumFontSize(BuildContext context) {
    return fontSize(context, size: 32, sm: 34, md: 36, lg: 38, xl: 40, xxl: 42);
  }

  /// Returns responsive display small font size (H3)
  static double displaySmallFontSize(BuildContext context) {
    return fontSize(context, size: 24, sm: 25, md: 26, lg: 27, xl: 28, xxl: 30);
  }

  /// Returns responsive headline large font size (H4)
  static double headlineLargeFontSize(BuildContext context) {
    return fontSize(context, size: 22, sm: 23, md: 24, lg: 25, xl: 26, xxl: 27);
  }

  /// Returns responsive headline medium font size
  static double headlineMediumFontSize(BuildContext context) {
    return fontSize(context, size: 20, sm: 21, md: 22, lg: 23, xl: 24, xxl: 25);
  }

  /// Returns responsive headline small font size
  static double headlineSmallFontSize(BuildContext context) {
    return fontSize(context, size: 18, sm: 19, md: 20, lg: 21, xl: 22, xxl: 23);
  }

  /// Returns responsive title large font size
  static double titleLargeFontSize(BuildContext context) {
    return fontSize(context, size: 16, sm: 17, md: 18, lg: 19, xl: 20, xxl: 21);
  }

  /// Returns responsive title medium font size
  static double titleMediumFontSize(BuildContext context) {
    return fontSize(context, size: 16, sm: 16, md: 17, lg: 18, xl: 19, xxl: 20);
  }

  /// Returns responsive title small font size
  static double titleSmallFontSize(BuildContext context) {
    return fontSize(context, size: 14, sm: 14, md: 15, lg: 16, xl: 17, xxl: 18);
  }

  /// Returns responsive body large font size
  static double bodyLargeFontSize(BuildContext context) {
    return fontSize(context, size: 14, sm: 14, md: 15, lg: 16, xl: 16, xxl: 17);
  }

  /// Returns responsive body medium font size
  static double bodyMediumFontSize(BuildContext context) {
    return fontSize(context, size: 14, sm: 14, md: 14, lg: 15, xl: 16, xxl: 16);
  }

  /// Returns responsive body small font size
  static double bodySmallFontSize(BuildContext context) {
    return fontSize(context, size: 12, sm: 12, md: 13, lg: 14, xl: 14, xxl: 15);
  }

  /// Returns responsive label large font size
  static double labelLargeFontSize(BuildContext context) {
    return fontSize(context, size: 12, sm: 12, md: 12, lg: 13, xl: 14, xxl: 14);
  }

  /// Returns responsive label medium font size
  static double labelMediumFontSize(BuildContext context) {
    return fontSize(context, size: 12, sm: 12, md: 12, lg: 12, xl: 13, xxl: 14);
  }

  /// Returns responsive label small font size
  static double labelSmallFontSize(BuildContext context) {
    return fontSize(context, size: 10, sm: 10, md: 11, lg: 11, xl: 12, xxl: 12);
  }
}
