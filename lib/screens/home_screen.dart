import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../state/app_state.dart';
import '../widgets/banner_widget.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> futureProducts;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _sortOption = '';

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToDetail(Product product) {
    Navigator.pushNamed(context, '/product-detail', arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
            icon: Badge(
              label: Text('${appState.favoriteCount}'),
              isLabelVisible: appState.favoriteCount > 0,
              child: const Icon(Icons.favorite_border),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            icon: Badge(
              label: Text('${appState.cartCount}'),
              isLabelVisible: appState.cartCount > 0,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.tintColorLight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.loadingProducts,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.loadingError,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        futureProducts = ApiService.fetchProducts();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text(AppStrings.retry),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.tintColorLight,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.noProducts,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }

          final products = snapshot.data!;
          final filteredProducts = _searchQuery.isEmpty
              ? products
              : products.where((product) {
                  final query = _searchQuery.toLowerCase().trim();
                  return product.name.toLowerCase().contains(query) ||
                      product.category.toLowerCase().contains(query) ||
                      product.description.toLowerCase().contains(query);
                }).toList();

          final sortedProducts = List<Product>.from(filteredProducts);
          if (_sortOption == 'fiyat_artan') {
            sortedProducts.sort((a, b) => a.price.compareTo(b.price));
          } else if (_sortOption == 'fiyat_dusen') {
            sortedProducts.sort((a, b) => b.price.compareTo(a.price));
          } else if (_sortOption == 'puan') {
            sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
          }

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                futureProducts = ApiService.fetchProducts();
              });
              await futureProducts;
            },
            color: AppColors.tintColorLight,
            child: CustomScrollView(
              slivers: [
                // Banner
                SliverToBoxAdapter(child: BannerWidget()),
                // Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.search,
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF2a2a2a)
                            : const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // Products Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${filteredProducts.length} Ürün',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            setState(() {
                              _sortOption = value;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  value == 'fiyat_artan'
                                      ? 'Fiyat: Düşükten Yükseğe seçildi'
                                      : value == 'fiyat_dusen'
                                      ? 'Fiyat: Yüksekten Düşüğe seçildi'
                                      : 'En Yüksek Puan seçildi',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem(
                              value: 'fiyat_artan',
                              child: Text('Fiyat: Düşükten Yükseğe'),
                            ),
                            const PopupMenuItem(
                              value: 'fiyat_dusen',
                              child: Text('Fiyat: Yüksekten Düşüğe'),
                            ),
                            const PopupMenuItem(
                              value: 'puan',
                              child: Text('En Yüksek Puan'),
                            ),
                          ],
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF2a2a2a)
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.sort,
                                  size: 20,
                                  color: AppColors.tintColorLight,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Sırala',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: AppColors.tintColorLight,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_sortOption.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF2a2a2a)
                                    : const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.label_rounded,
                                    size: 18,
                                    color: AppColors.tintColorLight,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _sortOption == 'fiyat_artan'
                                          ? 'Sıralama: Fiyat Artan'
                                          : _sortOption == 'fiyat_dusen'
                                          ? 'Sıralama: Fiyat Azalan'
                                          : 'Sıralama: En Yüksek Puan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _sortOption = '';
                                      });
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Products Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = sortedProducts[index];
                      final isLiked = appState.isFavorite(product.id);

                      return ProductCard(
                        product: product,
                        isLiked: isLiked,
                        onTap: () => _navigateToDetail(product),
                        onLikeToggle: (liked) =>
                            appState.toggleFavorite(product),
                      );
                    }, childCount: filteredProducts.length),
                  ),
                ),
                // Bottom padding
                SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
