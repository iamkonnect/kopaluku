import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';
import 'face_verification_screen.dart';

class NidaVerificationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const NidaVerificationScreen({super.key, required this.userData});

  @override
  State<NidaVerificationScreen> createState() => _NidaVerificationScreenState();
}

class _NidaVerificationScreenState extends State<NidaVerificationScreen> {
  XFile? _frontImage;
  XFile? _backImage;
  final ImagePicker _picker = ImagePicker();

  bool get _isComplete => _frontImage != null && _backImage != null;

  Future<void> _pickImage(ImageSource source, bool isFront) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        if (isFront) {
          _frontImage = image;
        } else {
          _backImage = image;
        }
      });
    }
  }

  void _showImagePicker(String type) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery, type == 'Front');
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera, type == 'Front');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FaceVerificationScreen(
          userData: {
            ...widget.userData,
            'nidaFront': _frontImage!.path,
            'nidaBack': _backImage!.path,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify NIDA')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upload NIDA Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Please upload clear photos of both sides of your NIDA card',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Front side
            Text(
              'Front Side',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _showImagePicker('Front'),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryGreen,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: _frontImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(_frontImage!.path, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported)),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 48, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text('Tap to upload', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 32),
            // Back side
            Text(
              'Back Side',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _showImagePicker('Back'),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryGreen,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: _backImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(_backImage!.path, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported)),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 48, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text('Tap to upload', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Back',
                    onPressed: () => Navigator.pop(context),
                    isOutlined: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: _isComplete ? 'Continue' : 'Upload both sides to continue',
                    onPressed: _isComplete ? _onContinue : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
