import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/pages/new_products/bloc/new_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewProductsScreen extends StatefulWidget {
  const NewProductsScreen({super.key});

  @override
  State<NewProductsScreen> createState() => _NewProductsScreenState();
}

class _NewProductsScreenState extends State<NewProductsScreen> {
  late NewProductsBloc bloc;
  @override
  void initState() {
    bloc = NewProductsBloc();
    // bloc.getNewProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            AppText.large('أحدث المنتجات'),

            const SizedBox(height: 16),

            // Products grid
            _buildProductsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsGrid() {
    final products = [
      ProductData(
        name: 'رز أسباني',
        description:
            'لما يكون الأكل زاكي... الاختيار أكيد رز أسباني من العصفور',
        imageUrl: AppImages.camolino2,
        rating: 4.5,
      ),
      ProductData(
        name: 'بقوليات العصقور',
        description: 'الطعم الأصيل، الجودة العالية، والفائدة بكل لقمة',
        imageUrl: AppImages.legumes,
        rating: 4.8,
      ),
      ProductData(
        name: 'شاي العصفصور',
        description:
            'استمتعوا بكوب شاي أصيل غني بالنكهة والرائحة، ليعدل مزاجكم',
        imageUrl: AppImages.tea,
        rating: 4.3,
      ),
      ProductData(
        name: 'حلاوة بالفستق',
        description: 'طعم غني بالفستق... متعة بكل لقمة مذاق أصيل، وفستق فاخر',
        imageUrl: AppImages.halawa,
        rating: 4.6,
      ),
      ProductData(
        name: 'تمر العصفور',
        description: 'الطعم اللي بيجمع بين النكهة الأصيلة والجودة العالية!',
        imageUrl: AppImages.dates,
        rating: 4.7,
      ),
      ProductData(
        name: 'زعتر العصفور الأحمر',
        description: 'الصلصة الطازجة اللذيذة التي تصنع طبقاً شهياً',
        imageUrl: AppImages.zattar,
        rating: 4.4,
      ),
    ];

    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 25,
      crossAxisSpacing: 12,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index], index);
      },
    );
  }

  Widget _buildProductCard(ProductData product, int index) {
    final bool isRightColumn = index % 2 == 0;

    return Transform.translate(
      offset: Offset(0, isRightColumn ? 2 : 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // مهم جدًا مع Masonry
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة + زر المفضلة
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
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                // زر المفضلة
                Positioned(
                  top: -18,
                  left: 8,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: const Color(0xFFE41E26),
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // تفاصيل المنتج
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min, // مهم
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body(
                    product.name,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  AppText.small(
                    product.description,
                    color: Colors.grey[600],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product data model
class ProductData {
  final String name;
  final String description;
  final String imageUrl;
  final double rating;

  ProductData({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });
}
