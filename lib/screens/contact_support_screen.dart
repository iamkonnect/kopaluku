import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitTicket() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ticket submitted! We will contact you within 24 hours.'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Support'),
        backgroundColor: AppTheme.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Help Fast',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Submit a ticket or use quick contact methods',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // Quick contact
            Text(
              'Quick Contact',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text('Phone Support'),
                    subtitle: const Text('0712 345 678'),
                    trailing: const Icon(Icons.call),
                    onTap: () {
                      // TODO: make phone call
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Calling support...')),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text('Email'),
                    subtitle: const Text('support@kopaluku.co.tz'),
                    trailing: const Icon(Icons.send),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening email client...')),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.orange),
                    title: const Text('Visit Us'),
                    subtitle: const Text('Dar es Salaam, Tanzania'),
                    trailing: const Icon(Icons.directions),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening maps...')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Support ticket form
            Text(
              'Submit Support Ticket',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? 'Subject required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Describe your issue',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? 'Message required' : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Submit Ticket',
                      onPressed: _submitTicket,
                    ),
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
