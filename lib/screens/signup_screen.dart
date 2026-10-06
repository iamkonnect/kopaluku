import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
final TextEditingController _nidaController = TextEditingController(text: '1233456');
  final TextEditingController _phoneController = TextEditingController(text: '123456789');
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nidaController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'nida': _nidaController.text,
        'phone': _phoneController.text,
        'email': _emailController.text.isNotEmpty ? _emailController.text : null,
      };
      Navigator.pushNamed(context, '/otp', arguments: userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'Let\'s get started',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your NIDA number and phone number to begin',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nidaController,
                decoration: const InputDecoration(
                  labelText: 'NIDA Number',
                  prefixIcon: Icon(Icons.badge),
                  hintText: 'e.g., 1234567890',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your NIDA number';
                  }
  if (value.length < 7) {
                    return 'Enter a valid NIDA number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'e.g., 0712345678',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  if (value.length < 9) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email (Optional)',
                  prefixIcon: Icon(Icons.email),
                  hintText: 'e.g., example@email.com',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: null,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Continue',
                onPressed: _onContinue,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: AppTheme.primaryGreen),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
