import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Dummy user data – later replace with actual data from backend
  final Map<String, String> _userData = {
    'name': 'John Doe',
    'nidaNumber': '1234567890',
    'phoneNumber': '0712345678',
    'email': 'john.doe@example.com',
  };

  bool _biometricEnabled = true;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
        backgroundColor: AppTheme.primaryGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              color: AppTheme.primaryGreen,
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.accentYellow,
                    child: Text(
                      _userData['name']![0],
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _userData['name']!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _userData['phoneNumber']!,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information Section
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _InfoTile(
                          icon: Icons.badge,
                          label: 'NIDA Number',
                          value: _userData['nidaNumber']!,
                        ),
                        const Divider(height: 1),
                        _InfoTile(
                          icon: Icons.phone_android,
                          label: 'Phone Number',
                          value: _userData['phoneNumber']!,
                        ),
                        const Divider(height: 1),
                        _InfoTile(
                          icon: Icons.email,
                          label: 'Email',
                          value: _userData['email']!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Credit Score Preview (optional)
                  const Text(
                    'Credit Health',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Current Credit Score', style: TextStyle(fontWeight: FontWeight.w500)),
                              Text('720 / 1000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to full credit report (optional)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Credit report coming soon')),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.accentYellow,
                                foregroundColor: AppTheme.primaryGreen,
                              ),
                              child: const Text('View Details'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Settings Section
                  const Text(
                    'Settings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: const Text('Biometric Login'),
                          subtitle: const Text('Use fingerprint or face ID to sign in'),
                          value: _biometricEnabled,
                          onChanged: (value) {
                            setState(() {
                              _biometricEnabled = value;
                            });
                            // TODO: save preference
                          },
                          secondary: const Icon(Icons.fingerprint),
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: const Text('Push Notifications'),
                          subtitle: const Text('Receive alerts about loans and payments'),
                          value: _notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                            // TODO: save preference
                          },
                          secondary: const Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Support & Legal
                  const Text(
                    'Support & Legal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.help_outline),
                          title: const Text('Help Center'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(context, '/help'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: const Text('Contact Support'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(context, '/contact'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.description),
                          title: const Text('Terms & Conditions'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(context, '/terms'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.privacy_tip),
                          title: const Text('Privacy Policy'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(context, '/privacy'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showLogoutDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Logout', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Clear secure storage
              await _storage.delete(key: 'auth_token');
              // Navigate back to sign in screen
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
              }
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryGreen),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

