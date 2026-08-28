# 🛍️ MYACHAT — Application E-commerce Flutter

> Application mobile e-commerce développée avec **Flutter**, permettant de consulter des produits, rechercher des articles, gérer les favoris, ajouter des produits au panier et consulter son profil utilisateur.

---

## 📱 Présentation

**MYACHAT** est une application mobile e-commerce développée avec Flutter.

Le projet a pour objectif de mettre en pratique une architecture propre et modulaire tout en proposant une expérience utilisateur moderne, responsive et adaptée aux mobiles et tablettes.

L'application utilise actuellement un **stockage local JSON** pour simuler la persistance des données.

### Objectifs du projet

* Concevoir une application e-commerce Flutter moderne.
* Mettre en place une architecture séparant l'interface, les services et la persistance.
* Créer des widgets réutilisables.
* Gérer les favoris et le panier.
* Implémenter un thème clair/sombre.
* Mettre en place une navigation multi-écrans.
* Gérer les états de chargement et les erreurs.
* Préparer l'application à une future connexion à une API REST.

---

# ✨ Fonctionnalités

## 🏠 Accueil

L'écran d'accueil permet de consulter les produits disponibles.

Fonctionnalités :

* Affichage des produits sous forme de grille.
* `GridView.builder`.
* Chargement asynchrone avec `FutureBuilder`.
* Affichage dynamique des produits.
* Gestion du chargement.
* Gestion des erreurs.
* Gestion du cas où aucun produit n'est disponible.
* Accès au détail d'un produit.

---

## 🔎 Recherche

Une barre de recherche permet de rechercher rapidement un produit.

Exemple :

```text
Recherche : "iphone"

             ↓

Produits correspondant à "iphone"
```

La recherche permet de filtrer les produits affichés selon leur nom ou leurs informations disponibles.

---

## 📦 Détail produit

L'écran de détail permet de consulter les informations complètes d'un produit.

Il peut notamment afficher :

* Image du produit.
* Nom.
* Description.
* Prix.
* Disponibilité.
* Statut favori.
* Ajout au panier.

---

## ❤️ Gestion des favoris

L'utilisateur peut ajouter ou retirer un produit de ses favoris.

Chaque produit possède notamment la propriété :

```json
{
  "id": 1,
  "name": "Produit exemple",
  "price": 45000,
  "isFavorite": true
}
```

La modification du statut `isFavorite` est persistée dans le stockage JSON.

Fonctionnalités :

* Ajouter aux favoris.
* Retirer des favoris.
* Consulter la liste des favoris.
* Persister l'état des favoris.

---

## 🛒 Panier

L'application propose une gestion du panier permettant de préparer une commande.

Fonctionnalités prévues/implémentées :

* Ajouter un produit au panier.
* Afficher les produits du panier.
* Modifier la quantité.
* Augmenter la quantité.
* Diminuer la quantité.
* Supprimer un produit.
* Calculer le total d'une ligne.
* Calculer le total du panier.

Exemple d'affichage :

```text
┌─────────────────────────────────┐
│ 🛒 Mon panier                   │
├─────────────────────────────────┤
│                                 │
│ Produit A              45 000 F │
│ [-]       2       [+]           │
│                                 │
│ Produit B              20 000 F │
│ [-]       1       [+]           │
│                                 │
├─────────────────────────────────┤
│ Sous-total             110 000 F│
│                                 │
│ TOTAL                  110 000 F│
│                                 │
│ [     PASSER LA COMMANDE     ]  │
└─────────────────────────────────┘
```

---

## 👤 Profil utilisateur

Un écran de profil utilisateur **mock** est également prévu.

Il permet de présenter une interface utilisateur sans nécessiter pour le moment de système d'authentification réel.

Informations affichées :

* Avatar.
* Nom utilisateur.
* Adresse e-mail.
* Informations personnelles.
* Mes commandes.
* Mes favoris.
* Paramètres.
* Notifications.
* Déconnexion.

Les données utilisateur sont actuellement simulées.

---

## 🌙 Thème clair / sombre

L'application prend en charge :

* Le thème clair.
* Le thème sombre.
* La modification dynamique du thème.
* L'utilisation du `ThemeData` Flutter.

Le thème est géré à travers le système de state management de l'application.

---

## 📱 Responsive Design

L'application est conçue pour s'adapter à différentes tailles d'écran :

* Smartphones.
* Tablettes.
* Écrans de différentes résolutions.

Une classe utilitaire `Responsive` est utilisée pour faciliter l'adaptation de l'interface.

---

# 🧩 Widgets réutilisables

Le projet utilise plusieurs widgets personnalisés afin d'éviter la duplication de code.

Exemples :

* `CustomGrid`
* `ProductCard`
* `CustomCartItem`
* `PrimaryButton`
* `SectionTitle`

### `ProductCard`

Permet d'afficher un produit de manière uniforme dans les différentes listes et grilles.

### `CustomCartItem`

Widget dédié à l'affichage d'un produit dans le panier.

Il gère notamment :

* Image.
* Nom.
* Prix.
* Quantité.
* Boutons `+` et `-`.
* Total.
* Suppression.

---

# 🏗️ Architecture

Le projet suit une architecture permettant de séparer les responsabilités.

```text
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
├── repositoriesImpl/
│   └── ProductRepositoryImpl.dart
│
├── services/
│   └── Productservices.dart
│
├── riverpods/
│   └── cartNotifier.dart
│   └── cartProvider.dart  
│   └── filterProductProvider.dart
│   └── ProductProvider.dart
│   └── productSortProvider.dart
│   └── searchProvider.dart
│
├── routers/
│   └── go_router.dart
│
├── screens/
│   ├── details_screen.dart
│   ├── favorite_screen.dart
│   ├── cart_screen.dart
│   ├── profile_screen.dart
│   ├── a_propos_screen.dart
│   └── nous_ecrire.dart
│
├── widgets/
│   ├── customGrid.dart
│   ├── primary_button.dart
│   ├── product_card.dart
│   ├── custom_cart_item.dart
│   └── section_title.dart
│   └── CartItemGrid.dart
│   └── customCartItem.dart
│
└── utilities/
    ├── FileStorage.dart
    └── Responsive.dart
```

---

# 🔄 Flux des données

Les données suivent le flux suivant :

```text
                  ┌─────────────┐
                  │     UI      │
                  └──────┬──────┘
                         │
                         ▼
               ┌─────────────────┐
               │ riverpods │
               └────────┬────────┘
                        │
                        ▼
               ┌─────────────────┐
               │ Productservices │
               └────────┬────────┘
                        │
                        ▼
               ┌─────────────────┐
               │ Repository<T>   │
               └────────┬────────┘
                        │
                        ▼
          ┌──────────────────────────┐
          │ ProductRepositoryImpl    │
          └────────────┬─────────────┘
                       │
                       ▼
               ┌─────────────────┐
               │   FileStorage   │
               └────────┬────────┘
                        │
                        ▼
               ┌─────────────────┐
               │  products.json  │
               └─────────────────┘
```

Cette séparation permet de remplacer ultérieurement le stockage JSON par une API REST sans modifier profondément l'interface utilisateur.

---

# 💾 Stockage des données

Les produits sont actuellement stockés dans :

```text
products.json
```

Exemple :

```json
[
  {
    "id": 1,
    "name": "iPhone 15",
    "price": 450000,
    "isFavorite": true
  },
  {
    "id": 2,
    "name": "Samsung Galaxy S24",
    "price": 400000,
    "isFavorite": false
  }
]
```

Le champ `isFavorite` permet de conserver l'état favori du produit.

---

# 🛠️ Technologies utilisées

| Technologie   | Utilisation                 |
|---------------| --------------------------- |
| Flutter       | Framework mobile            |
| Dart          | Langage de programmation    |
| FutureBuilder | Chargement asynchrone       |
| riverpods     | Gestion d'état              |
| GoRouter      | Navigation                  |
| JSON          | Stockage local des produits |
| FileStorage   | Gestion de la persistance   |
| Responsive    | Adaptation aux écrans       |

---

# 📂 Structure du projet

```text
app_multi_screens/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── assets/
│
├── lib/
│
├── test/
│
├── products.json
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

---

# 🚀 Installation

### 1. Cloner le projet

```bash
git clone https://github.com/ikader37/app_multi_screens.git
```

### 2. Se positionner sur la branche commerce

```bash
cd app_multi_screens

git checkout commerce
```

### 3. Installer les dépendances

```bash
flutter pub get
```

### 4. Vérifier l'environnement Flutter

```bash
flutter doctor
```

### 5. Lancer l'application

```bash
flutter run
```

---

# 🧪 Tests

Les tests sont disponibles dans :

```text
test/
```

Pour exécuter les tests :

```bash
flutter test
```

---

# 🔮 Évolutions prévues

Le projet pourra évoluer vers une véritable plateforme e-commerce.

### Authentification

* Inscription.
* Connexion.
* Déconnexion.
* Réinitialisation du mot de passe.
* Gestion du profil.

### Produits

* API REST.
* Pagination.
* Catégories.
* Filtres.
* Tri.
* Gestion des stocks.

### Panier

* Persistance complète du panier.
* Synchronisation avec le compte utilisateur.
* Validation de commande.

### Commandes

* Création de commande.
* Historique des commandes.
* Suivi de commande.
* Détails d'une commande.

### Backend

Le stockage JSON pourra être progressivement remplacé par :

```text
Flutter
   │
   ▼
REST API
   │
   ▼
Backend
   │
   ▼
Database
```

---

# 🎯 Objectifs pédagogiques

Ce projet permet de mettre en pratique :

* Architecture Flutter.
* Programmation orientée objet.
* Repository Pattern.
* Séparation des responsabilités.
* Widgets réutilisables.
* Gestion d'état.
* Navigation.
* Persistance locale.
* Gestion des erreurs.
* Responsive Design.
* Formulaires et validation.
* Tests Flutter.

---

# 📌 État du projet

| Fonctionnalité          | État |
| ----------------------- | :--: |
| Liste des produits      |   ✅  |
| Recherche               |   ✅  |
| Détail produit          |   ✅  |
| Favoris                 |   ✅  |
| Persistance des favoris |   ✅  |
| Panier                  |  🚧  |
| Profil utilisateur mock |  🚧  |
| Thème clair/sombre      |   ✅  |
| Responsive              |   ✅  |
| Navigation GoRouter     |   ✅  |
| Stockage JSON           |   ✅  |
| API REST                |  🔜  |
| Authentification        |  🔜  |
| Commandes               |  🔜  |
| Paiement                |  🔜  |

---

# 👨‍💻 Auteur

**Abdoul Kader**

Projet personnel réalisé avec Flutter dans le cadre de la mise en pratique de l'architecture, de la gestion d'état et du développement d'une application e-commerce.

---

# 📄 Licence

Ce projet est destiné à un usage pédagogique et expérimental.
