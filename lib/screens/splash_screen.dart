import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading (check for existing session, etc.)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to sign in (or sign up if new user)
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo placeholder – replace with your asset
            Icon(
              Icons.flash_on,
              size: 80,
              color: AppTheme.accentYellow,
            ),
            const SizedBox(height: 16),
            Text(
              'KopaLuku',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.accentYellow,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Borrow Luku, Pay Later',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
