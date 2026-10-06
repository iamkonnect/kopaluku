import 'package:flutter/material.dart';

class BorrowStatusScreen extends StatelessWidget {
  final bool isAccepted;

  const BorrowStatusScreen({super.key, required this.isAccepted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow Request Status'),
        centerTitle: true,
        backgroundColor: const Color(0xFF006837),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Prevent back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              isAccepted ? Icons.check_circle_outline : Icons.cancel_outlined,
              color: isAccepted ? Colors.green : Colors.red,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              isAccepted ? 'Request Accepted!' : 'Request Rejected!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isAccepted ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isAccepted
                  ? 'Please wait for your Luku token to be sent via SMS.'
                  : 'Unfortunately, your borrow request could not be processed at this time.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen (or a specific dashboard)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Back to Home', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}