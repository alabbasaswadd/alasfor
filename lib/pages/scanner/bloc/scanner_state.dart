import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_state.freezed.dart';

@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default(false) bool isCameraOpen,
    @Default('') String scannedCode,
    String? capturedImagePath,
    ScanResult? scanResult,
  }) = _ScannerState;
}

class ScanResult {
  final String id;
  final bool isValid;
  final String message;
  final PrizeInfo? prize;

  const ScanResult({
    required this.id,
    required this.isValid,
    required this.message,
    this.prize,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(
      id: json['id']?.toString() ?? '',
      isValid: json['is_valid'] ?? false,
      message: json['message'] ?? '',
      prize: json['prize'] != null ? PrizeInfo.fromJson(json['prize']) : null,
    );
  }
}

class PrizeInfo {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const PrizeInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory PrizeInfo.fromJson(Map<String, dynamic> json) {
    return PrizeInfo(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
