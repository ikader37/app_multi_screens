# 🛍️ MYACHAT

> Application mobile Flutter de découverte et de consultation de produits, avec recherche, navigation multi-écrans, gestion du thème clair/sombre et interface responsive.

---

## 📱 Présentation

**MYACHAT** est une application Flutter conçue pour offrir une expérience simple, moderne et intuitive de consultation de produits.

L'application permet notamment de :

- consulter une liste de produits ;
- rechercher un produit ;
- consulter les détails d'un produit ;
- naviguer entre plusieurs écrans ;
- gérer les produits favoris ;
- contacter l'équipe via un formulaire ;
- consulter la page À propos ;
- changer le thème de l'application ;
- s'adapter aux écrans mobiles et tablettes.

Le projet met également en pratique plusieurs concepts importants de Flutter :

- `FutureBuilder`
- `GoRouter`
- `Provider`
- widgets réutilisables
- séparation UI / données
- responsive design
- gestion des erreurs
- validation de formulaires
- thème clair / sombre

---

# ✨ Fonctionnalités

## 🏠 Accueil

L'écran d'accueil permet de consulter les produits disponibles sous forme de grille.

Fonctionnalités :

- affichage des produits avec `GridView.builder` ;
- affichage dynamique des données ;
- chargement avec `FutureBuilder` ;
- gestion des erreurs ;
- message lorsqu'aucun produit n'est disponible ;
- accès au détail d'un produit.

---

## 🔎 Recherche

Une barre de recherche est disponible directement dans l'`AppBar`.

L'utilisateur peut rechercher un produit en temps réel.

Exemple :

```text
Recherche : "iphone"

        ↓

Produits correspondant à "iphone"
```

## ARCHITECTURE
lib/
│
├── main.dart
│
├── models/
│   └── Products.dart
│
├── repositories/
│   └── Repository.dart
│
├── RepositoriesImpl/
│   └── ProductRepositoryImpl.dart
│
├── services/
│   └── productServices.dart
│
├── providers/
│   └── theme_providers.dart
│
├── routers/
│   └── go_router.dart
│
├── screens/
│   ├── details_screen.dart
│   ├── a_propos_screen.dart
│   ├── nous_ecrire.dart
│   └── favorite_screen.dart
│
├── widgets/
│   └── customGrid.dart
│   └── primary_button.dart
│   └── product_card.dart
│   └── section_title.dart
│
│
└── utilities/
    ├── FileStorage.dart
    └── Responsive.dart

## Les donnees suivent le flux suivant
                    UI
                     │
                     ▼
              Productservices
                     │
                     ▼
             Repository<T>
                     │
                     ▼
          Productrepositoryimpl
                     │
                     ▼
                FileStorage
                     │
                     ▼
              products.json