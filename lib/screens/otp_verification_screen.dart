import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';
import 'nida_verification_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const OtpVerificationScreen({super.key, required this.userData});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  void _verifyOtp() async {
    if (_otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the 6-digit code')),
      );
      return;
    }

    setState(() => _isLoading = true);
    // TODO: call backend to verify OTP
    await Future.delayed(const Duration(seconds: 1)); // simulate
    setState(() => _isLoading = false);

    // On success, navigate to sign in
    if (_otpController.text == '123456') { // dummy check
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NidaVerificationScreen(userData: widget.userData),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  void _resendOtp() {
    // TODO: call backend to resend OTP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent to your phone number')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Phone')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'Verification Code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
    Text(
      'We sent a 6-digit code to ${widget.userData['phone']}',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
            ),
            const SizedBox(height: 32),
            Pinput(
              controller: _otpController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: AppTheme.primaryGreen, width: 2),
                ),
              ),
              onCompleted: (pin) => _verifyOtp(),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Verify',
              onPressed: _verifyOtp,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code? ",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                TextButton(
                  onPressed: _resendOtp,
                  child: const Text('Resend', style: TextStyle(color: AppTheme.primaryGreen)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
