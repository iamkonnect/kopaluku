import 'package:flutter/material.dart';
import 'package:kopaluku/borrow_status_screen.dart'; // Import the new status screen
import 'dart:math'; // For simulating random acceptance/rejection

class BorrowLukuScreen extends StatefulWidget {
  const BorrowLukuScreen({super.key});

  @override
  State<BorrowLukuScreen> createState() => _BorrowLukuScreenState();
}

class _BorrowLukuScreenState extends State<BorrowLukuScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _meterNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _submitBorrowRequest() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate an API call or processing time
    await Future.delayed(const Duration(seconds: 2));

    // Simulate acceptance or rejection (e.g., 70% chance of acceptance)
    final bool isAccepted = Random().nextDouble() > 0.3;

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BorrowStatusScreen(isAccepted: isAccepted),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _meterNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow Luku'),
        centerTitle: true,
        backgroundColor: const Color(0xFF006837),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount to Borrow (TSH)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _meterNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Luku Meter Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your meter number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitBorrowRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006837),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Submit Request', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}