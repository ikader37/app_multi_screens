import 'package:app_multi_screens/providers/theme_providers.dart';
import 'package:app_multi_screens/riverpods/CartProvider.dart';
import 'package:app_multi_screens/riverpods/ProductProvier.dart';
import 'package:app_multi_screens/riverpods/filterProductsProvider.dart';
import 'package:app_multi_screens/riverpods/productSortProvider.dart';
import 'package:app_multi_screens/riverpods/searchProvider.dart';
import 'package:app_multi_screens/routers/go_router.dart';
import 'package:app_multi_screens/servicesImpl/productServicesImpl.dart';
import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/customGrid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/Products.dart';

void main() {
  runApp(
    // MaterialApp.router(
    //   routerConfig: appRouter,
    //   title: "MYACHAT"
    // ),
    ProviderScope(
      // create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'MYACHAT',

      routerConfig: appRouter,

      // themeMode: themeProvider.themeMode,
      //
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.blue,
      //     foregroundColor: Colors.white,
      //   ),
      // ),
      //
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: const Color(0xFF121212),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xFF1F1F1F),
      //     foregroundColor: Colors.white,
      //   ),
      // ),
    );
    // home: Center(child: MyHomePage(title: 'MyAchats')),
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  String title;
  MyHomePage({required this.title});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  // final ProductservicesImpl productservices = ProductservicesImpl();
  Responsive responsive = Responsive();
  final TextEditingController searchController = TextEditingController();

  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    final products = ref.watch(sortedProductsProvider);
    final cart = ref.watch(cartProvider);

    final location = GoRouterState.of(buildContext).uri.path;

    int currentIndex = 0;

    if (location.startsWith('/products')) {
      currentIndex = 1;
    } else if (location.startsWith('/favorites')) {
      currentIndex = 2;
    } else if (location.startsWith('/profile')) {
      currentIndex = 3;
    }
    return Scaffold(
      bottomNavigationBar: responsive.isMobile(buildContext)
          ? BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    buildContext.pushNamed('home');
                    break;

                  case 1:
                    buildContext.pushNamed('myFavorites');
                    break;

                  case 2:
                    buildContext.pushNamed('apropos');
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favoris',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'A Propos',
                ),
              ],
            )
          : null,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(hintText: "Search"),
          onChanged: (values) {
            // setState(() {
            //   search=values;
            // });
            ref.read(searchProvider.notifier).state = values;
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          DropdownButton(
            items: [
              DropdownMenuItem(
                value: ProductSort.name,
                child: Text(
                  ""
                  "Title",
                ),
              ),
              DropdownMenuItem(
                value: ProductSort.priceAscending,
                child: Text("price ascending"),
              ),
              DropdownMenuItem(
                value: ProductSort.priceDescending,
                child: Text("price descending"),
              ),
            ],
            onChanged: (values) {
              ref.read(productSortProvider.notifier).state = values!;
            },
          ),
          Badge(
            label: Text("${cart.length}", style: TextStyle(color: Colors.red)),
            child: IconButton(
              onPressed: () => {context.pushNamed("carts")},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          IconButton(
            onPressed: () => {
              context.pushNamed("profil")
              },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: products?.when(
        data: (products) {
          return CustomGrid(items: products);
        },
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(child: Text('Erreur : $error')),
      ),
    );
  }
}
