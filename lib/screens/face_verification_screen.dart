import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../widgets/custom_button.dart';

class FaceVerificationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const FaceVerificationScreen({super.key, required this.userData});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isReady = false;
  bool _isVerifying = false;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras![1], ResolutionPreset.medium); // Front camera
      await _controller!.initialize();
      if (mounted) {
        setState(() => _isReady = true);
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _captureFace() async {
    if (_controller != null && _controller!.value.isInitialized) {
      setState(() => _isVerifying = true);
      final XFile image = await _controller!.takePicture();
      setState(() {
        _capturedImage = image;
        _isVerifying = false;
      });
    }
  }

  void _completeVerification() {
    // Dummy success - save user data
    // TODO: integrate with backend/ML face match
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Face verification completed successfully! Welcome!')),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Verification')),
      body: Stack(
        children: [
          if (_isReady && _controller != null)
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRect(
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller!.value.previewSize!.height,
                      height: _controller!.value.previewSize!.width,
                      child: CameraPreview(_controller!),
                    ),
                  ),
                ),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),
          // UI overlay
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Position your face within the circle',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Bottom buttons
          if (_capturedImage == null)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: CustomButton(
                  text: _isVerifying ? 'Verifying...' : 'Capture Face',
                  onPressed: _captureFace,
                  isLoading: _isVerifying,
                ),
              ),
            )
          else
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Back',
                      onPressed: () => setState(() => _capturedImage = null),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      text: 'Complete',
                      onPressed: _completeVerification,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
