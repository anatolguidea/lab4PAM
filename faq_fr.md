# FAQ (FR) — Refactorisation vers JSON + GetX

## 1) Qu’est‑ce qui a été changé ?
Nous avons déplacé les données « en dur » des écrans vers des fichiers JSON d’assets, ajouté des repositories pour les charger, et introduit des contrôleurs GetX pour gérer l’état. L’UI consomme désormais des données réactives.

## 2) Pourquoi utiliser des fichiers JSON ?
- Séparation des données et de l’UI
- Facile à modifier/swapper sans toucher le code Dart
- Prépare l’app pour d’autres sources (API, cache, etc.)

## 3) Où sont les nouveaux fichiers JSON ?
- `assets/data/home.json` (catégories, recettes, nouvelles recettes)
- `assets/data/ingredients.json` (ingrédients d’une recette)

## 4) Qu’est‑ce que GetX apporte ici ?
- Gestion d’état réactive simple (`Rx`, `Obx`)
- Injection de dépendances (`Get.put`) pour les contrôleurs
- Navigation et utilitaires (`GetMaterialApp`, `Get.to`, snackbars, etc.)

## 5) Pourquoi remplacer `MaterialApp` par `GetMaterialApp` ?
`GetMaterialApp` offre le même comportement que `MaterialApp` mais active les fonctionnalités GetX (navigation, DI, traductions) sans configuration supplémentaire.

## 6) Quels sont les nouveaux contrôleurs ?
- `HomeController` charge catégories/recettes/nouvelles recettes depuis `home.json`
- `RecipeController` charge les ingrédients depuis `ingredients.json`

## 7) Où se fait le chargement des données ?
Dans les repositories:
- `lib/data/home_repository.dart` lit `home.json`
- `lib/data/recipe_repository.dart` lit `ingredients.json`

## 8) Comment l’UI devient réactive ?
Les contrôleurs exposent des variables `Rx` (ex: `recipes`, `isLoading`). Les widgets utilisent `Obx(() { ... })` pour rebuild lorsque ces valeurs changent.

## 9) Comment la sélection de catégorie fonctionne ?
`HomeController.selectCategory(int)` met à jour `selectedCategory`. Un filtrage peut être ajouté là pour filtrer `recipes` selon une catégorie dans le JSON (à étendre si besoin).

## 10) Qu’est‑ce qui a changé dans la barre de menu ?
`MenuSelector` est devenu stateless et contrôlé par le parent. Il reçoit `categories`, `selectedIndex` et `onSelect` pour une meilleure testabilité et logique centralisée.

## 11) Quels modèles ont été adaptés au JSON ?
- `Recipe`, `NewRecipe`, `Ingredient` disposent de `factory fromJson(...)` pour parser les maps JSON.

## 12) Comment ajouter une nouvelle recette ?
Ajoutez une entrée dans `assets/data/home.json` sous `recipes` ou `new_recipes` avec les mêmes champs. Redémarrez (hot reload suffit si l’asset est déjà listé dans `pubspec.yaml`).

## 13) Comment ajouter un nouvel ingrédient ?
Ajoutez une entrée dans `assets/data/ingredients.json` sous `ingredients` avec `title`, `imagePath`, `quantity`.

## 14) Comment tester rapidement ?
- `flutter pub get`
- `flutter run`
Les écrans affichent un loader pendant la lecture des JSON, puis les données.

## 15) Puis‑je changer plus tard vers une API ?
Oui. Remplacez l’implémentation des repositories pour interroger un backend (HTTP) sans toucher l’UI; les contrôleurs restent identiques.

## 16) Où commencer pour le filtrage par catégorie ?
- Ajoutez un champ `category` à chaque recette dans `home.json`
- Dans `HomeController.selectCategory`, filtrez `recipes` selon la catégorie choisie (ou maintenez une liste source + une liste filtrée).

## 17) Comment afficher une erreur de chargement personnalisée ?
Les contrôleurs exposent `error`. Dans l’UI, on affiche `Text('Error: ...')` quand `error.isNotEmpty`. Remplacez par un widget dédié (snackbar `Get.snackbar`, carte d’erreur, etc.).

## 18) Quels fichiers principaux ont été modifiés ?
- `lib/main.dart` → `GetMaterialApp`
- `lib/screens/home_screen.dart` → consommation via `HomeController` + `Obx`
- `lib/screens/recipe_page.dart` → consommation via `RecipeController` + `Obx`
- `lib/widgets/menu_bar_widget.dart` → stateless contrôlé

## 19) Y a‑t‑il des impacts sur la navigation ?
Non pour l’instant; nous utilisons encore `Navigator.push`. On peut passer à `Get.to(...)` facilement si désiré.

## 20) Comment étendre avec des routes nommées et bindings ?
Dans `GetMaterialApp`, configurez `getPages` et `initialBinding`. Créez des `Bindings` pour instancier les contrôleurs par écran.

---

Si vous souhaitez, je peux ajouter le filtrage par catégorie, des routes nommées GetX, ou un exemple de `Binding` pour les contrôleurs.
