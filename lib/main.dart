import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/home_screen.dart';
import 'screens/payback_screen.dart';
import 'screens/history_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/help_center_screen.dart';
import 'screens/contact_support_screen.dart';
import 'screens/terms_screen.dart';
import 'screens/nida_verification_screen.dart';
import 'screens/face_verification_screen.dart';
import 'screens/privacy_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const KopaLukuApp());

class KopaLukuApp extends StatelessWidget {
  const KopaLukuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KopaLuku',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otp': (context) => OtpVerificationScreen(
              userData: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
            ),
        '/signin': (context) => const SignInScreen(),
'/home': (context) => const HomeScreen(),
        '/payback': (context) => const PaybackScreen(),
        '/history': (context) => const HistoryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/help': (context) => const HelpCenterScreen(),
        '/contact': (context) => const ContactSupportScreen(),
        '/terms': (context) => const TermsScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/nida': (context) => NidaVerificationScreen(
              userData: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {},
            ),
        '/face': (context) => FaceVerificationScreen(
              userData: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {},
            ),
      },
    );
  }
}
