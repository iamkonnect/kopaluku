import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: AppTheme.primaryGreen,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KopaLuku Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: December 2024',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Text(
              '1. DATA COLLECTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'We collect personal identification information including NIDA details, phone numbers, and biometric data (face verification) to comply with Bank of Tanzania regulations and for credit assessment.',
            ),
            SizedBox(height: 24),
            Text(
              '2. DATA SECURITY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Your data is encrypted and stored securely. We do not share your personal information with third parties except as required by law or for regulatory compliance with the Bank of Tanzania.',
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}