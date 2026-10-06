import 'package:flutter/material.dart';
import 'package:kopaluku/borrow_luku_screen.dart'; // Import the new borrow screen

class PaybackScreen extends StatelessWidget {
  const PaybackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payback'),
        centerTitle: true,
        backgroundColor: const Color(0xFF006837), // Branding green
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Outstanding Balance',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              'TSH 15,000',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006837),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Logic for paying own debt
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Pay My Debt', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(height: 16),
            // The requested "Pay for someone" button
            OutlinedButton.icon(
              onPressed: () {
                // Logic to navigate to "Pay for Someone" form
              },
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Pay for Someone Else'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF006837),
                side: const BorderSide(color: Color(0xFF006837)),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 16),
            // New "Borrow Luku" button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BorrowLukuScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837), // Branding green
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Borrow Luku', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}