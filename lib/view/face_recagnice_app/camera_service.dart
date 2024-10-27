import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class CameraService {
  CameraController? controller;
  List<CameraDescription>? cameras;
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector();

  Future<void> initCamera() async {
    cameras = await availableCameras();

    CameraDescription? frontCamera;
    for (CameraDescription camera in cameras!) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        break;
      }
    }

    if (frontCamera != null) {
      controller = CameraController(
        frontCamera,
        ResolutionPreset.high,
      );
      await controller!.initialize();
    } else {
      throw Exception("No front camera found");
    }
  }

  Future<XFile?> takePicture() async {
    if (!controller!.value.isInitialized) {
      return null;
    }
    return await controller!.takePicture();
  }

  Future<List<Face>> detectFaces(InputImage image) async {
    // Detect faces in the provided image
    return await faceDetector.processImage(image);
  }

  void dispose() {
    controller?.dispose();
    faceDetector.close();
  }
}
