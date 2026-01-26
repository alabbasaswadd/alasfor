import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/home/bloc/home_bloc.dart';
import 'package:alasfor/pages/home/bloc/home_event.dart';
import 'package:alasfor/pages/home/bloc/home_state.dart';
import 'package:alasfor/pages/home/model/banner_model.dart';
import 'package:alasfor/pages/home/model/home_product_model.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
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
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPromoBanner(),
                    _buildSearchBar(),
                    const SizedBox(height: 16),

                    ...state.banners.map(
                      (banner) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildBannerCard(banner),
                      ),
                    ),
                    _buildLatestProducts(state.products),
                  ],
                ),
              ),
            ),
          );
        },
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
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
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
      padding: EdgeInsets.all(16),
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              banner.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
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
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              color: AppColors.white,
                              size: 18,
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AppText.body(
                    banner.description,
                    color: AppColors.white,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestProducts(List<HomeProductModel> products) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
                  fontWeight: FontWeight.w700,
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to all products
                  },
                  child: const AppText.body(
                    'عرض الكل >',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
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
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
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
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_outline, color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          AppText.medium(product.name, fontWeight: FontWeight.w700),
          AppText.body(product.description),
        ],
      ),
    );
  }
}
