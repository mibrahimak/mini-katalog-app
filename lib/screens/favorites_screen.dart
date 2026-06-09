import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../state/app_state.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);
    final favorites = appState.favoriteProducts;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.favoritesTitle)),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                AppStrings.emptyFavorites,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = favorites[index];
                      return ProductCard(
                        product: product,
                        isLiked: true,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/product-detail',
                            arguments: product,
                          );
                        },
                        onLikeToggle: (_) {
                          appState.toggleFavorite(product);
                        },
                      );
                    }, childCount: favorites.length),
                  ),
                ),
              ],
            ),
    );
  }
}
