import 'package:app_multi_screens/riverpods/CartProvider.dart';
import 'package:app_multi_screens/riverpods/productSortProvider.dart';
import 'package:app_multi_screens/riverpods/searchProvider.dart';
import 'package:app_multi_screens/routers/go_router.dart';
import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/customGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(

    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'MYACHAT',

      routerConfig: appRouter,

    );
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
    final productsAsync = ref.watch(sortedProductsProvider);    final cart = ref.watch(cartProvider);

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
          DropdownButton<ProductSort>(
            hint: Text("Trier"),
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
      body: productsAsync.when(
        data: (productsAsync) {
          return CustomGrid(items: productsAsync);
        },
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Impossible de charger les produits',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {
                      ref.invalidate(sortedProductsProvider);
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
          );
        },



      ),
    );
  }
}
