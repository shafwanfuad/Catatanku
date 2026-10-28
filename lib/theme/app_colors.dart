import 'package:flutter/material.dart';
import 'theme_controller.dart';

class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryLight = Color(0xFF818CF8); // Indigo 400
  static const Color primaryDark = Color(0xFF3730A3); // Indigo 800

  static const Color secondary = Color(0xFF0EA5E9); // Sky 500

  // Static constants for Light theme setup
  static const Color lightBackground = Color(0xFFF8FAFC); // Slate 50
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCardBorder = Color(0xFFE2E8F0); // Slate 200
  static const Color lightTextPrimary = Color(0xFF0F172A); // Slate 900
  static const Color lightTextSecondary = Color(0xFF64748B); // Slate 500
  static const Color lightTextMuted = Color(0xFF94A3B8); // Slate 400
  static const Color lightPrimarySoft = Color(0xFFEEF2FF); // Indigo 50
  static const Color lightSecondarySoft = Color(0xFFE0F2FE); // Sky 50

  // Static constants for Dark theme setup
  static const Color darkBackground = Color(0xFF0B1120); // Deep Midnight Slate
  static const Color darkSurface = Color(0xFF1E293B); // Slate 800 Card Surface
  static const Color darkCardBorder = Color(0xFF334155); // Slate 700 Border
  static const Color darkTextPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color darkTextSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color darkTextMuted = Color(0xFF64748B); // Slate 500
  static const Color darkPrimarySoft = Color(0xFF1E1B4B); // Indigo 950
  static const Color darkSecondarySoft = Color(0xFF082F49); // Sky 950

  // Dynamic Getters responding directly to ThemeController
  static bool get isDark => ThemeController().isDarkMode;

  static Color get background => isDark ? darkBackground : lightBackground;
  static Color get surface => isDark ? darkSurface : lightSurface;
  static Color get cardSurface => isDark ? darkSurface : lightSurface;
  static Color get cardBorder => isDark ? darkCardBorder : lightCardBorder;

  static Color get textPrimary => isDark ? darkTextPrimary : lightTextPrimary;
  static Color get textSecondary => isDark ? darkTextSecondary : lightTextSecondary;
  static Color get textMuted => isDark ? darkTextMuted : lightTextMuted;

  static Color get primarySoft => isDark ? darkPrimarySoft : lightPrimarySoft;
  static Color get secondarySoft => isDark ? darkSecondarySoft : lightSecondarySoft;

  // Priority Colors
  static const Color priorityHigh = Color(0xFFEF4444); // Red 500
  static const Color lightPriorityHighBg = Color(0xFFFEE2E2); // Red 100
  static const Color darkPriorityHighBg = Color(0xFF450A0A); // Red 950
  static Color get priorityHighBg => isDark ? darkPriorityHighBg : lightPriorityHighBg;

  static const Color priorityMedium = Color(0xFFF59E0B); // Amber 500
  static const Color lightPriorityMediumBg = Color(0xFFFEF3C7); // Amber 100
  static const Color darkPriorityMediumBg = Color(0xFF451A03); // Amber 950
  static Color get priorityMediumBg => isDark ? darkPriorityMediumBg : lightPriorityMediumBg;

  static const Color priorityLow = Color(0xFF10B981); // Emerald 500
  static const Color lightPriorityLowBg = Color(0xFFD1FAE5); // Emerald 100
  static const Color darkPriorityLowBg = Color(0xFF022C22); // Emerald 950
  static Color get priorityLowBg => isDark ? darkPriorityLowBg : lightPriorityLowBg;

  // Note Pastel & Dark Color Options
  static const List<ColorOption> noteColors = [
    ColorOption(
      id: 'indigo',
      name: 'Nila',
      color: Color(0xFFEEF2FF),
      borderColor: Color(0xFFC7D2FE),
      accentColor: Color(0xFF4F46E5),
      darkColor: Color(0xFF181E36),
      darkBorderColor: Color(0xFF2E3860),
    ),
    ColorOption(
      id: 'sky',
      name: 'Biru Langit',
      color: Color(0xFFE0F2FE),
      borderColor: Color(0xFFBAE6FD),
      accentColor: Color(0xFF0284C7),
      darkColor: Color(0xFF112638),
      darkBorderColor: Color(0xFF1C4566),
    ),
    ColorOption(
      id: 'emerald',
      name: 'Mint Segar',
      color: Color(0xFFDCFCE7),
      borderColor: Color(0xFFBBF7D0),
      accentColor: Color(0xFF059669),
      darkColor: Color(0xFF112920),
      darkBorderColor: Color(0xFF1C4D3D),
    ),
    ColorOption(
      id: 'amber',
      name: 'Kuning Hangat',
      color: Color(0xFFFEF3C7),
      borderColor: Color(0xFFFDE68A),
      accentColor: Color(0xFFD97706),
      darkColor: Color(0xFF282112),
      darkBorderColor: Color(0xFF52401C),
    ),
    ColorOption(
      id: 'rose',
      name: 'Merah Muda',
      color: Color(0xFFFFE4E6),
      borderColor: Color(0xFFFECDD3),
      accentColor: Color(0xFFE11D48),
      darkColor: Color(0xFF28151D),
      darkBorderColor: Color(0xFF542233),
    ),
    ColorOption(
      id: 'purple',
      name: 'Lavender',
      color: Color(0xFFF3E8FF),
      borderColor: Color(0xFFDDD6FE),
      accentColor: Color(0xFF7C3AED),
      darkColor: Color(0xFF221733),
      darkBorderColor: Color(0xFF452B6B),
    ),
  ];
}

class ColorOption {
  final String id;
  final String name;
  final Color color;
  final Color borderColor;
  final Color accentColor;
  final Color darkColor;
  final Color darkBorderColor;

  const ColorOption({
    required this.id,
    required this.name,
    required this.color,
    required this.borderColor,
    required this.accentColor,
    required this.darkColor,
    required this.darkBorderColor,
  });

  Color get displayColor => ThemeController().isDarkMode ? darkColor : color;
  Color get displayBorder => ThemeController().isDarkMode ? darkBorderColor : borderColor;
}
