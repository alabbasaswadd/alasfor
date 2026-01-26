import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/new_products/bloc/new_products_bloc.dart';
import 'package:alasfor/pages/new_products/bloc/new_products_event.dart';
import 'package:alasfor/pages/new_products/bloc/new_products_state.dart';
import 'package:alasfor/pages/new_products/model/products_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.initState();
    bloc = NewProductsBloc();
    bloc.add(GetNewProductsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.xlarge('أحدث المنتجات'),
            const SizedBox(height: 24),
            _buildProductsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsGrid() {
    return BlocBuilder<NewProductsBloc, NewProductsState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.isError) {
          return Center(
            child: AppText.body(state.errorMessage, color: Colors.red),
          );
        } else if (state.products.isEmpty) {
          return Center(
            child: AppText.body(
              'لا توجد منتجات جديدة حالياً.',
              color: Colors.grey,
            ),
          );
        }
        return MasonryGridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 25,
          crossAxisSpacing: 12,
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(state.products[index], index);
          },
        );
      },
    );
  }

  Widget _buildProductCard(ProductsModel product, int index) {
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
          mainAxisSize: MainAxisSize.min,
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
                  child: CachedNetworkImage(
                    imageUrl: product.image!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),

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
                        Icons.favorite_outline,
                        color: AppColors.primary,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body(
                    product.title ?? '',
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  AppText.small(
                    product.description ?? "",
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
