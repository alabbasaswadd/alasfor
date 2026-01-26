import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class ScannerEvent extends BaseEvent {
  const ScannerEvent();
}

class InitScannerEvent extends ScannerEvent {
  const InitScannerEvent();
}

class ScanQRCodeEvent extends ScannerEvent {
  final String qrCode;
  const ScanQRCodeEvent(this.qrCode);
}

class SubmitQRCodeEvent extends ScannerEvent {
  final String qrCode;
  const SubmitQRCodeEvent(this.qrCode);
}

class ResetScannerEvent extends ScannerEvent {
  const ResetScannerEvent();
}

class OpenCameraEvent extends ScannerEvent {
  const OpenCameraEvent();
}

class CloseCameraEvent extends ScannerEvent {
  const CloseCameraEvent();
}

class CaptureImageEvent extends ScannerEvent {
  final String imagePath;
  const CaptureImageEvent(this.imagePath);
}
