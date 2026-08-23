import 'package:app_multi_screens/providers/theme_providers.dart';
import 'package:app_multi_screens/routers/go_router.dart';
import 'package:app_multi_screens/services/productServices.dart';
import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/customGrid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/Products.dart';

void main() {
  runApp(
      // MaterialApp.router(
      //   routerConfig: appRouter,
      //   title: "MYACHAT"
      // ),
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'MYACHAT',

      routerConfig: appRouter,

      themeMode: themeProvider.themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.white,
        ),
      ),
    );
      // home: Center(child: MyHomePage(title: 'MyAchats')),
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>{
  final Productservices productservices = Productservices();
  Responsive responsive = Responsive();
  final TextEditingController searchController =
  TextEditingController();

  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext buildContext) {
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
        onChanged: (values){
            setState(() {
              search=values;
            });
        },),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              buildContext.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              buildContext.read<ThemeProvider>().toggleTheme();
            },
          )
        ],
      ),
      body: FutureBuilder<List<Products>>(
        future: search!=''?productservices.searchProducts(search):productservices.listAllProducts(),

        builder: (context, snapshot) {
          // 1. Chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Erreur
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          // 3. Pas de données
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun produit disponible'));
          }

          // 4. Données disponibles
          final products = snapshot.data!;

          return CustomGrid(items: products);
        },
      ),
    );
  }


}
