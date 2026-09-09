import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../providers/attendance_provider.dart';

class FaceClockInScreen extends ConsumerStatefulWidget {
  const FaceClockInScreen({super.key});

  @override
  ConsumerState<FaceClockInScreen> createState() => _FaceClockInScreenState();
}

class _FaceClockInScreenState extends ConsumerState<FaceClockInScreen> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isInitialized = false;
  bool _isProcessing = false;
  String? _errorMessage;
  bool _success = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() => _errorMessage = 'No cameras found on this device.');
        return;
      }

      // Prefer the front camera
      final front = _cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );

      _cameraController = CameraController(
        front,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      setState(() => _errorMessage = 'Camera error: $e');
    }
  }

  Future<void> _captureAndClockIn() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    setState(() {
      _isProcessing = true;
      _errorMessage = null;
    });

    try {
      final dir = await getTemporaryDirectory();
      final path = p.join(dir.path, 'face_${DateTime.now().millisecondsSinceEpoch}.jpg');

      final xFile = await _cameraController!.takePicture();
      final imageFile = File(xFile.path);
      await imageFile.copy(path);

      final notifier = ref.read(attendanceProvider.notifier);
      await notifier.clockInWithFace(imagePath: path);

      setState(() {
        _success = true;
        _isProcessing = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Clocked in successfully via face recognition!'),
            backgroundColor: Color(0xFF22C55E),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) Navigator.pop(context, true);
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
        _errorMessage = e.toString().replaceAll('Exception: ', '');
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Face Clock-In'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ── Camera Preview ──────────────────────────
          Expanded(
            child: _buildCameraPreview(),
          ),

          // ── Status & Controls ────────────────────────
          Container(
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
            child: Column(
              children: [
                if (_errorMessage != null)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
                    ),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (_success)
                  const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 64)
                else
                  _buildCaptureButton(),
                const SizedBox(height: 12),
                Text(
                  _isProcessing
                      ? 'Verifying your identity…'
                      : 'Position your face in the circle and tap the button',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_errorMessage != null && !_isInitialized) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt_outlined, color: Colors.white54, size: 64),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(color: Colors.white54)),
          ],
        ),
      );
    }

    if (!_isInitialized || _cameraController == null) {
      return const Center(child: CircularProgressIndicator(color: Colors.white));
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        // Full-screen camera
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _cameraController!.value.previewSize?.height ?? 1,
              height: _cameraController!.value.previewSize?.width ?? 1,
              child: CameraPreview(_cameraController!),
            ),
          ),
        ),
        // Oval face overlay
        CustomPaint(
          size: const Size(240, 320),
          painter: _OvalOverlayPainter(),
        ),
      ],
    );
  }

  Widget _buildCaptureButton() {
    return GestureDetector(
      onTap: _isProcessing ? null : _captureAndClockIn,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: _isProcessing
              ? const LinearGradient(colors: [Color(0xFF6B7280), Color(0xFF4B5563)])
              : const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: _isProcessing
              ? []
              : [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.5),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
        ),
        child: _isProcessing
            ? const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
              )
            : const Icon(Icons.face_retouching_natural, color: Colors.white, size: 36),
      ),
    );
  }
}

/// Paints a semi-transparent dark overlay with an oval cutout for the face
class _OvalOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.45);

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final ovalRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    final path = Path()
      ..addRect(rect)
      ..addOval(ovalRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);

    // Draw oval border
    final borderPaint = Paint()
      ..color = const Color(0xFF818CF8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawOval(ovalRect, borderPaint);
  }

  @override
  bool shouldRepaint(_OvalOverlayPainter oldDelegate) => false;
}
