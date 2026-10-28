import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Indonesian locale for dates
  await initializeDateFormatting('id_ID', null);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const CatatanKuApp());
}

class CatatanKuApp extends StatelessWidget {
  const CatatanKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = ThemeController();
    return AnimatedBuilder(
      animation: themeCtrl,
      builder: (context, _) {
        return MaterialApp(
          title: 'CatatanKu',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeCtrl.themeMode,
          builder: (context, child) {
            return MobileResponsiveWrapper(child: child ?? const SizedBox());
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}

/// A responsive wrapper that maintains an authentic mobile aspect ratio on Desktop/Web
/// while preserving full screen width on actual mobile devices.
class MobileResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const MobileResponsiveWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isDark = ThemeController().isDarkMode;

    // If screen is wider than 520px (Desktop / Web preview), wrap in a sleek mobile frame
    if (screenWidth > 520) {
      const double targetWidth = 420;
      final double targetHeight = mediaQuery.size.height.clamp(600.0, 880.0);

      return Container(
        color: isDark ? const Color(0xFF030712) : const Color(0xFF0F172A), // Dark slate background for preview
        child: Center(
          child: Container(
            width: targetWidth,
            height: targetHeight,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0B1120) : Colors.white,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                ),
              ],
              border: Border.all(
                color: isDark ? const Color(0xFF1E293B) : const Color(0xFF334155),
                width: 4,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: MediaQuery(
              data: mediaQuery.copyWith(
                size: Size(targetWidth, targetHeight),
              ),
              child: child,
            ),
          ),
        ),
      );
    }

    return child;
  }
}
