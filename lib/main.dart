import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'constants/strings.dart';
import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'state/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool _isDarkMode = false;
  final AppState _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      notifier: _appState,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            case '/product-detail':
              final product = settings.arguments as Product;
              return MaterialPageRoute(
                builder: (_) => ProductDetailScreen(product: product),
              );
            case '/favorites':
              return MaterialPageRoute(builder: (_) => const FavoritesScreen());
            case '/cart':
              return MaterialPageRoute(builder: (_) => const CartScreen());
            default:
              return MaterialPageRoute(builder: (_) => const HomeScreen());
          }
        },
        home: const HomeScreen(),
      ),
    );
  }
}
