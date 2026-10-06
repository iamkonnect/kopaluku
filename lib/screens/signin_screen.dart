import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
final TextEditingController _nidaController = TextEditingController(text: '1233456');
  final TextEditingController _phoneController = TextEditingController(text: '123456789');
  bool _isLoading = false;

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // TODO: call backend to authenticate
      await Future.delayed(const Duration(seconds: 1)); // simulate
      setState(() => _isLoading = false);
      // On success, navigate to home
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in with your NIDA number and phone number',
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
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter NIDA number';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone_android),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter phone number';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Sign In',
                onPressed: _signIn,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: const Text(
                      'Sign Up',
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
