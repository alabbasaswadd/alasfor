import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'package:image_picker/image_picker.dart';
import 'scanner_event.dart';
import 'scanner_state.dart';

class ScannerBloc extends BaseBloc<ScannerEvent, ScannerState> {
  final ImagePicker _picker;

  ScannerBloc({ImagePicker? picker})
      : _picker = picker ?? ImagePicker(),
        super(const ScannerState()) {
    on<InitScannerEvent>(_initScanner);
    on<ScanQRCodeEvent>(_scanQRCode);
    on<SubmitQRCodeEvent>(_submitQRCode);
    on<ResetScannerEvent>(_resetScanner);
    on<OpenCameraEvent>(_openCamera);
    on<CloseCameraEvent>(_closeCamera);
    on<CaptureImageEvent>(_captureImage);
  }

  Future<void> _initScanner(
    InitScannerEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: false,
      isError: false,
      scannedCode: '',
      scanResult: null,
      capturedImagePath: null,
    ));
  }

  Future<void> _scanQRCode(
    ScanQRCodeEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(
      scannedCode: event.qrCode,
      isCameraOpen: false,
    ));

    // Automatically submit after scanning
    add(SubmitQRCodeEvent(event.qrCode));
  }

  Future<void> _submitQRCode(
    SubmitQRCodeEvent event,
    Emitter<ScannerState> emit,
  ) async {
    if (event.qrCode.isEmpty) {
      emit(state.copyWith(
        isError: true,
        errorMessage: 'الرجاء مسح رمز QR صالح',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // TODO: Replace with actual API call when ready
      // await handleApiCall<ScanResult>(
      //   emit: emit,
      //   apiCall: () => _api.validateQRCode(event.qrCode),
      //   loadingState: () => state.copyWith(isLoading: true),
      //   successState: (result) => state.copyWith(
      //     isLoading: false,
      //     isSuccess: true,
      //     scanResult: result,
      //   ),
      //   errorState: (error) => state.copyWith(
      //     isLoading: false,
      //     isError: true,
      //     errorMessage: error,
      //   ),
      //   dataParser: (data) => ScanResult.fromJson(data),
      //   defaultErrorMessage: 'فشل التحقق من رمز QR',
      //   showSuccessMessage: true,
      //   successMessage: 'تم التحقق من الرمز بنجاح',
      // );

      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        scanResult: const ScanResult(
          id: '1',
          isValid: true,
          message: 'تم التحقق من الرمز بنجاح',
        ),
      ));

      showSuccessSnackBar('تم التحقق من الرمز بنجاح');
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _resetScanner(
    ResetScannerEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(const ScannerState());
  }

  Future<void> _openCamera(
    OpenCameraEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(isCameraOpen: true, isError: false));

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        emit(state.copyWith(
          isCameraOpen: false,
          capturedImagePath: image.path,
        ));

        // Process the captured image for QR code
        // TODO: Add QR code detection logic here
        // For now, we'll just store the image path
      } else {
        emit(state.copyWith(isCameraOpen: false));
      }
    } catch (e) {
      emit(state.copyWith(
        isCameraOpen: false,
        isError: true,
        errorMessage: 'فشل فتح الكاميرا: ${e.toString()}',
      ));
    }
  }

  Future<void> _closeCamera(
    CloseCameraEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(isCameraOpen: false));
  }

  Future<void> _captureImage(
    CaptureImageEvent event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(
      capturedImagePath: event.imagePath,
      isCameraOpen: false,
    ));

    // TODO: Process the image for QR code detection
  }
}
