import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: AppTheme.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _FAQItem(
                question: 'How do I apply for a loan?',
                answer: '1. Complete signup with NIDA & phone\n2. Verify OTP\n3. Upload NIDA front/back\n4. Complete face verification\n5. Go to Home → Borrow Luku',
              ),
              _FAQItem(
                question: 'What are the loan terms?',
                answer: '• Repayment period: 30 days\n• Late payments reported to CRB\n• Interest: 4% per month\n• Regulated by Bank of Tanzania',
              ),
              _FAQItem(
                question: 'What happens if I miss payment?',
                answer: '• Late fees apply\n• Reported to Credit Reference Bureau (CRB)• Multiple defaults may affect future credit\n• Contact support for extensions',
              ),
              _FAQItem(
                question: 'How do I repay?',
                answer: '• Use Payback screen\n• M-Pesa, Airtel Money, Tigo Pesa\n• Early repayment encouraged (no penalty)',
              ),
              _FAQItem(
                question: 'How to improve credit score?',
                answer: '• Pay on time\n• Small regular loans\n• Complete repayments\n• Score shown on Home screen',
              ),
              const SizedBox(height: 32),
              Center(
                child: CustomButton(
                  text: 'Contact Support',
                  onPressed: () => Navigator.pushNamed(context, '/contact'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
