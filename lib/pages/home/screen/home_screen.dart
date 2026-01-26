import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/home/bloc/home_bloc.dart';
import 'package:alasfor/pages/home/bloc/home_event.dart';
import 'package:alasfor/pages/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
    _bloc.add(const RefreshHomeEvent());
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
        backgroundColor: const Color(0xFFFAFAFA),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading && state.banners.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isError && state.banners.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(state.errorMessage),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _bloc.add(const RefreshHomeEvent()),
                      child: const AppText.body('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  _bloc.add(const RefreshHomeEvent());
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildPromoBanner(),
                      const SizedBox(height: 16),
                      _buildSearchBar(),
                      const SizedBox(height: 16),
                      ...state.banners.map((banner) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _buildBannerCard(banner),
                          )),
                      const SizedBox(height: 24),
                      _buildLatestProducts(state.products),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            );
          },
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
                const Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: AppText.medium(
                        'اختاروا الجودة... واختاروا حبّة بتحكوا عنها!',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.redExtraDeep,
                    ),
                    const SizedBox(width: 6),
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
            decoration: const BoxDecoration(
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
            child: GestureDetector(
              onTap: () {
                // TODO: Navigate to search screen or show search dialog
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.secondary,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[400], size: 22),
                    const SizedBox(width: 12),
                    const AppText.body('ابحث عن منتج'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.secondary, AppColors.goldDark],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.tune, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCard(BannerModel banner) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(banner.imageUrl, fit: BoxFit.contain),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.large(banner.title, color: AppColors.white),
                if (banner.rating != null)
                  Row(
                    children: [
                      AppText.medium(
                        banner.rating!.toString(),
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.star, color: AppColors.white),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText.body(
              banner.description,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestProducts(List<HomeProductModel> products) {
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
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to all products
                  },
                  child: const AppText.body(
                    'عرض الكل >',
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: products.isEmpty
                ? const Center(child: AppText.body('لا توجد منتجات'))
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return _buildProductCard(products[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(HomeProductModel product) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to product details
      },
      child: Container(
        width: 140,
        decoration: const BoxDecoration(
          boxShadow: [],
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
                    product.imageUrl,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      _bloc.add(ToggleFavoriteEvent(product.id));
                    },
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
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite
                            ? const Color(0xFFE41E26)
                            : Colors.grey[400],
                        size: 18,
                      ),
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
      ),
    );
  }
}
