import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/scanner/bloc/scanner_bloc.dart';
import 'package:alasfor/pages/scanner/bloc/scanner_event.dart';
import 'package:alasfor/pages/scanner/bloc/scanner_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late ScannerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ScannerBloc();
    _bloc.add(const InitScannerEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ScannerBloc, ScannerState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.large('السحب الكبير'),
                  AppText.small('فرصة دخول حصرية'),
                  const SizedBox(height: 30),
                  const AppText.medium(
                    'وجّه كاميرا هاتفك نحو أي رمز QR للمسابقة لتكشف عن جائزتك الفورية',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildQRFrame(state),
                  const SizedBox(height: 20),
                  _buildOpenCameraButton(state),
                  if (state.scanResult != null) ...[
                    const SizedBox(height: 20),
                    _buildScanResult(state.scanResult!),
                  ],
                  if (state.isError) ...[
                    const SizedBox(height: 20),
                    _buildErrorMessage(state.errorMessage),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQRFrame(ScannerState state) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(70),
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: state.isCameraOpen
            ? const CircularProgressIndicator()
            : Icon(
                state.capturedImagePath != null
                    ? Icons.check_circle
                    : Icons.qr_code_scanner_outlined,
                size: 100,
                color: state.capturedImagePath != null
                    ? Colors.green
                    : AppColors.goldDark,
              ),
      ),
    );
  }

  Widget _buildOpenCameraButton(ScannerState state) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFE41E26),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE41E26).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: state.isLoading || state.isCameraOpen
              ? null
              : () {
                  _bloc.add(const OpenCameraEvent());
                },
          child: Center(
            child: state.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const AppText.medium('افتح الكاميرا', color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildScanResult(ScanResult result) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: result.isValid ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: result.isValid ? Colors.green : Colors.red,
        ),
      ),
      child: Column(
        children: [
          Icon(
            result.isValid ? Icons.check_circle : Icons.error,
            color: result.isValid ? Colors.green : Colors.red,
            size: 48,
          ),
          const SizedBox(height: 8),
          AppText.medium(
            result.message,
            textAlign: TextAlign.center,
            color: result.isValid ? Colors.green.shade700 : Colors.red.shade700,
          ),
          if (result.prize != null) ...[
            const SizedBox(height: 16),
            AppText.large(
              result.prize!.name,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            AppText.body(
              result.prize!.description,
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              _bloc.add(const ResetScannerEvent());
            },
            child: const AppText.body('مسح رمز آخر'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red),
      ),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: AppText.body(
              message,
              color: Colors.red.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
