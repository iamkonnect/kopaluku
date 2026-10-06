import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../borrow_luku_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
// Dummy user data – later fetch from backend
    final String userName = "John";
    final int creditScore = 720; // out of 1000
    final double borrowingLimit = 50000; // TZS
    final double activeLoanRemaining = 20000; // TZS remaining
    final String loanDueDate = "2025-04-28";
    final List<Map<String, dynamic>> recentTransactions = [
      {'date': '2025-03-28', 'type': 'Borrow', 'amount': 20000, 'status': 'Completed'},
      {'date': '2025-03-25', 'type': 'Repay', 'amount': 15000, 'status': 'Completed'},
      {'date': '2025-03-20', 'type': 'Borrow', 'amount': 10000, 'status': 'Completed'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('KopaLuku'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Card
            Card(
              color: AppTheme.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $userName!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ready to power your day?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Credit Score Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Your Credit Score',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentYellow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${(creditScore / 10).toStringAsFixed(0)}%',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: creditScore / 1000,
                      backgroundColor: Colors.grey.shade200,
                      color: AppTheme.primaryGreen,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Borrowing Limit: TZS ${borrowingLimit.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Repay on time to increase your score!',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Active Loan Card
            if (activeLoanRemaining > 0) ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Active Loan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text('Due Soon', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'TZS ${activeLoanRemaining.toStringAsFixed(0)} remaining',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      Text('Due: $loanDueDate', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pushNamed(context, '/payback'),
                          icon: const Icon(Icons.payment),
                          label: const Text('Pay Now'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Main Borrow Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to borrow screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BorrowLukuScreen()),
                  );
                },
                icon: const Icon(Icons.flash_on, size: 28),
                label: const Text(
                  'Borrow Luku',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentYellow,
                  foregroundColor: AppTheme.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions Row
            Row(
              children: [
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.payment,
                    label: activeLoanRemaining > 0 ? 'Pay Back Loan' : 'Pay Back',
                    onTap: () => Navigator.pushNamed(context, '/payback'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.history,
                    label: 'History',
                    onTap: () => Navigator.pushNamed(context, '/history'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Transactions
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentTransactions.length,
              itemBuilder: (context, index) {
                final tx = recentTransactions[index];
                final isBorrow = tx['type'] == 'Borrow';
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isBorrow ? Colors.red.shade50 : Colors.green.shade50,
                      child: Icon(
                        isBorrow ? Icons.arrow_downward : Icons.arrow_upward,
                        color: isBorrow ? Colors.red : Colors.green,
                      ),
                    ),
                    title: Text(tx['type']),
                    subtitle: Text(tx['date']),
                    trailing: Text(
                      'TZS ${tx['amount']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isBorrow ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable quick action button widget
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppTheme.primaryGreen),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
