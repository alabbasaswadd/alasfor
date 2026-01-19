import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.large('السحب الكبير'),
            AppText.small('فرصة دخول حصرية'),
            SizedBox(height: 30),
            AppText.medium(
              'وجّه كاميرا هاتفك نحو أي رمز QR للمسابقة لتكشف عن جائزتك الفورية',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            _buildQRFrame(),
            SizedBox(height: 20),
            // Open camera button
            _buildOpenCameraButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildQRFrame() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(70),
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.qr_code_scanner_outlined,
          size: 100,
          color: AppColors.goldDark,
        ),
      ),
    );
  }

  Widget _buildOpenCameraButton() {
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
          onTap: () async {
            final XFile? image = await _picker.pickImage(
              source: ImageSource.camera,
            );

            if (image != null) {
              print('Image path: ${image.path}');
              // هنا تعالج الصورة أو ترسلها
            }
          },
          child: const Center(
            child: AppText.medium('افتح الكاميرا', color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
