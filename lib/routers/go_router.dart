import 'dart:async';

import 'package:app_multi_screens/main.dart';
import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/screens/a_propos_screen.dart';
import 'package:app_multi_screens/screens/details_screen.dart';
import 'package:app_multi_screens/screens/favorite_screen.dart';
import 'package:app_multi_screens/screens/nous_ecrire.dart';
import 'package:app_multi_screens/services/productServices.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "home",
      builder: (context, state) =>  MyHomePage(title: "MYACHAT"),
    ),
    GoRoute(
      path: "/myFavorites",
      name: "myFavorites",
      builder: (context, state) =>  MyFavorites(),
    ),
    GoRoute(
      path: "/details/:id",
      name: "details",
      builder: (context, state) {
        final  id = state.pathParameters['id']!;
        return DetailsScreen(selectedId: int.parse(id));
      },

    ),
    GoRoute(
      path: "/a_propos",
      name: "apropos",
      builder: (context, state) =>AProposScreen()

    ),
    GoRoute(
        path: "/nous_ecrire",
        name: "nous_ecrire",
        builder: (context, state) =>NousEcrire()

    ),
  ],
);
