import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPromoBanner(),

              const SizedBox(height: 16),

              // Search bar
              _buildSearchBar(),

              const SizedBox(height: 16),

              // Eid card
              _buildEidCard(),

              const SizedBox(height: 16),

              // Limited offer card
              _buildLimitedOfferCard(),

              const SizedBox(height: 24),

              // Latest products section
              _buildLatestProducts(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFDB913), Color(0xFFF9E79F)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: const AppText.medium(
                        'اختاروا الجودة... واختاروا حبّة بتحكوا عنها!',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.redExtraDeep,
                    ),
                    SizedBox(width: 6),
                    const AppText.body(
                      'عرض تفاصيل المنتج',
                      maxLines: 2,
                      color: AppColors.redExtraDeep,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Image.asset(AppImages.camolino, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[400], size: 22),
                  const SizedBox(width: 12),
                  AppText.body('ابحث عن منتج'),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.secondary, AppColors.goldDark],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.tune, color: AppColors.white),
            ),
          ), // Spacing on the right
        ],
      ),
    );
  }

  Widget _buildEidCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.jomaa, fit: BoxFit.contain),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.large("جمعة مباركة", color: AppColors.white),

                Row(
                  children: [
                    AppText.medium(
                      '4.8',
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.star, color: AppColors.white),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText.body(
              "(إن أفضل أيامكم يوم الجمعة، فأكثروا علي من الصلاة فيه، فإن صلاتكم معروضة علي)",
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLimitedOfferCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.year, fit: BoxFit.contain),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.large("مع بداية عام 2026", color: AppColors.white),

                Row(
                  children: [
                    AppText.medium(
                      '4.5',
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.star, color: AppColors.white),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText.body(
              "تتقدم أسرة العصفور بأصدق التهاني والتمنيات لكم، سائلين الله أن يكون عاما مليئا بالخير، والتفاؤل",
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestProducts() {
    return Container(
      decoration: BoxDecoration(color: AppColors.goldDark.withOpacity(0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.medium(
                  'أحدث المنتجات',
                  fontWeight: FontWeight.bold,
                ),
                AppText.body('عرض الكل >', color: AppColors.primary),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildProductCard(
                  'موراللا',
                  AppImages.camolino2,
                  isFavorite: true,
                ),
                const SizedBox(width: 12),
                _buildProductCard(
                  'راڤيولي بالسبانخ',
                  AppImages.camolino2,
                  isFavorite: false,
                ),
                const SizedBox(width: 12),
                _buildProductCard(
                  'لازانيا',
                  AppImages.camolino2,
                  isFavorite: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String imageUrl, {
    bool isFavorite = false,
  }) {
    return Container(
      width: 140,
      decoration: BoxDecoration(boxShadow: [
      
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imageUrl,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? const Color(0xFFE41E26)
                        : Colors.grey[400],
                    size: 18,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE41E26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://i.pravatar.cc/50?img=20',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
