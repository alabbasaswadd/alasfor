import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WinnersScreen extends StatelessWidget {
  const WinnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.large('الفائزون'),
            AppText.body("أشخاص حقيقيون يفوزون بجوائز حقيقية "),
            SizedBox(height: 50),
            _buildWinnersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWinnersList() {
    final winners = [
      WinnerData(
        name: 'علاء ياسر',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=11',
      ),
      WinnerData(
        name: 'معتصم الخولي',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=12',
      ),
      WinnerData(
        name: 'محمد اليوسف',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=13',
      ),
      WinnerData(
        name: 'صفا طعان',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=14',
      ),
      WinnerData(
        name: 'أحمد محمود',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=15',
      ),
      WinnerData(
        name: 'سارة علي',
        subtitle: 'فاز بجهاز ايفون 15',
        details: 'فاز في 15 يناير',
        imageUrl: 'https://i.pravatar.cc/150?img=16',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: winners.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9, // عدلها حسب شكل الكرت
      ),
      itemBuilder: (context, index) {
        return _buildWinnerCard(winners[index]);
      },
    );
  }

  Widget _buildWinnerCard(WinnerData winner) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                // Name
                AppText.medium(winner.name, textAlign: TextAlign.center),
                const SizedBox(height: 4),
                // Prize
                AppText.body(
                  winner.subtitle,
                  textAlign: TextAlign.center,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 4),
                // Date
                AppText.small(
                  winner.details,
                  textAlign: TextAlign.center,
                  color: AppColors.blueBorder,
                ),
              ],
            ),
            Positioned(
              top: -50,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(winner.imageUrl),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDB913),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.emoji_events_outlined,
                        size: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Winner data model
class WinnerData {
  final String name;
  final String subtitle;
  final String details;
  final String imageUrl;

  WinnerData({
    required this.name,
    required this.subtitle,
    required this.details,
    required this.imageUrl,
  });
}
