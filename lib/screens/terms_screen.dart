import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: AppTheme.primaryGreen,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KopaLuku Terms & Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: December 2024\n\nLast Updated: December 2024',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Text(
              '1. INTRODUCTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
These Terms & Conditions ("Terms") govern your use of KopaLuku mobile application ("App") and services ("Services") provided by KopaLuku Ltd, a company registered in the United Republic of Tanzania.

By using the App, you agree to these Terms, our Privacy Policy, and compliance with Bank of Tanzania (BoT) Digital Financial Services Regulations 2021.
'''),
            SizedBox(height: 24),
            Text(
              '2. ELIGIBILITY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
• Must be 18+ years old
• Tanzanian resident with valid NIDA
• Active mobile money account
• Good credit standing (no CRB blacklist)
'''),
            SizedBox(height: 24),
            Text(
              '3. LOAN SERVICES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
3.1 Loan amounts: TZS 10,000 - 500,000
3.2 Term: 30 days maximum
3.3 Interest: 4% per month (maximum allowed by BoT)
3.4 Late fees: 2% per day after due date
3.5 Early repayment: No penalty
'''),
            SizedBox(height: 24),
            Text(
              '4. DEFAULT & CRB REPORTING',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 12),
            Text('''
• 7 days overdue → SMS reminder
• 14 days overdue → Call reminder
• 30 days overdue → Reported to Credit Reference Bureau (CRB)
• CRB listing affects future credit access
• Legal recovery for amounts > TZS 50,000
'''),
            SizedBox(height: 24),
            Text(
              '5. KYC VERIFICATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
• NIDA verification mandatory
• Face verification using camera
• Biometric data stored securely
• Verification data shared with BoT regulators if required
'''),
            SizedBox(height: 24),
            Text(
              '6. PAYMENTS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
• Mobile money only (M-Pesa, Airtel, Tigo)
• All payments irreversible
• Processing fee: 1.5% (max BoT rate)
'''),
            SizedBox(height: 24),
            Text(
              '7. REGULATORY COMPLIANCE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
• Licensed by Bank of Tanzania
• DFS Regulations 2021 compliant
• Data Protection Act 2022 compliant
• Anti-Money Laundering regulations
'''),
            SizedBox(height: 24),
            Text(
              '8. TERMINATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
KopaLuku may suspend/terminate account for:
• Fraud suspicion
• Repeated defaults
• Regulatory violation
'''),
            SizedBox(height: 24),
            Text(
              '9. DISPUTE RESOLUTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('''
• Contact support first
• Escalate to BoT Consumer Protection Unit
• Final arbitration per Tanzania law
'''),
            SizedBox(height: 24),
            Text(
              'Governing Law: Laws of United Republic of Tanzania',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'By using KopaLuku, you acknowledge reading and accepting these Terms',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
