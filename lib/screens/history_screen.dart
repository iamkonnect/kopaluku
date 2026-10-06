import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [
      {
        'type': 'Borrow',
        'date': '2025-03-28 14:30',
        'amount': 20000,
        'status': 'Completed',
        'details': 'Instant loan approved',
      },
      {
        'type': 'Repayment',
        'date': '2025-03-25 09:15',
        'amount': 15000,
        'status': 'Completed',
        'details': 'Via Vodacom M-Pesa',
      },
      {
        'type': 'Borrow',
        'date': '2025-03-20 16:45',
        'amount': 10000,
        'status': 'Completed',
        'details': 'Quick cash loan',
      },
      {
        'type': 'Repayment',
        'date': '2025-03-18 11:20',
        'amount': 5000,
        'status': 'Completed',
        'details': 'Via Airtel Money',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan History'),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'Total Transactions', 
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                      Text(
                        '${history.length}', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    final isBorrow = item['type'] == 'Borrow';
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: CircleAvatar(
                          backgroundColor: isBorrow ? Colors.red.shade50 : Colors.green.shade50,
                          radius: 14,
                          child: Icon(
                            isBorrow ? Icons.download : Icons.upload,
                            color: isBorrow ? Colors.red : Colors.green,
                            size: 16,
                          ),
                        ),
                        title: Text(
                          item['type'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey[700], fontSize: 12),
                            children: [
                              TextSpan(text: item['date'] + '\n'),
                              TextSpan(text: item['details']),
                            ],
                          ),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TZS ${item['amount']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isBorrow ? Colors.red : Colors.green,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 0),
                              constraints: const BoxConstraints(maxWidth: 95, maxHeight: 20),
                              child: Chip(
                                label: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    item['status'],
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ),
                                backgroundColor: Colors.green.shade100,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('${item['type']} - TZS ${item['amount']}'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date: ${item['date']}'),
                                  Text('Status: ${item['status']}'),
                                  Text('Details: ${item['details']}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
