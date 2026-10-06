import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PaybackScreen extends StatelessWidget {
  const PaybackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy loan data
    final double loanAmount = 20000;
    final double paidAmount = 0;
    final double remaining = loanAmount - paidAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Back Loan'),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Loan Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.account_balance, color: AppTheme.primaryGreen),
                      title: const Text('Total Loan'),
                      trailing: Text('TZS $loanAmount', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment, color: Colors.orange),
                      title: const Text('Paid'),
                      trailing: Text('TZS $paidAmount', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.warning, color: Colors.red),
                      title: const Text('Remaining', style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text('TZS ${remaining.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _PaymentMethodCard(
                    icon: Icons.phone_android,
                    name: 'Vodacom M-Pesa',
                    color: Color(0xFF1877F2),
                  ),
                  _PaymentMethodCard(
                    icon: Icons.phone_iphone,
                    name: 'Mixx by Yass',
                    color: Color(0xFF00A651),
                  ),
                  _PaymentMethodCard(
                    icon: Icons.wifi,
                    name: 'Airtel Money',
                    color: Color(0xFFDC2D2D),
                  ),
                  _PaymentMethodCard(
                    icon: Icons.credit_card,
                    name: 'Selcom',
                    color: Color(0xFF1E3A8A),
                  ),
                  _PaymentMethodCard(
                    icon: Icons.account_balance_wallet,
                    name: 'Halopesa',
                    color: Color(0xFF00BCD4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;

  const _PaymentMethodCard({
    required this.icon,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Stub payment initiation
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$name payment initiated for TZS 20,000'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text('Enter amount to pay', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
