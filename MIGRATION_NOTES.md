§# Remote data migration

This project originally loaded home and recipe detail data from JSON files in `assets/data`. It now pulls live data from the provided APIs:
- Home feed: `https://test-api-jlbn.onrender.com/v2/feed`
- Recipe details: `https://test-api-jlbn.onrender.com/v2/feed/details`

## What changed
- **Dependencies**: Added the `http` package in `pubspec.yaml` to perform network requests.
- **Models**:
  - Added `lib/models/home_data.dart` with `HomeUser`, `FilterCategory`, and `HomeData`.
  - Added `lib/models/recipe_detail.dart` with `RecipeSummary`, `Chef`, `ServingInfo`, and `RecipeDetailData`.
  - Updated `Recipe`, `NewRecipe`, and `Ingredient` models to match the API fields (IDs, names, URLs, rating/time formats).
- **Repositories**:
  - `HomeRepository` now hits `/v2/feed`, parses user, filters, recipes, and new_recipes from the response.
  - `RecipeRepository` now hits `/v2/feed/details`, returning full detail data instead of reading `ingredients.json`.
- **Controllers**:
  - `HomeController` exposes user info, search placeholder, and server-driven category selection; loads from the remote feed.
  - `RecipeController` fetches full recipe details and ingredients from the detail endpoint.
- **UI updates**:
  - Header/search/categories render dynamic values from the API.
  - Cards and detail views now load images from network URLs with fallbacks.
  - Recipe detail page shows server-provided summary, chef info, serving info, and ingredients.

## Behavior notes
- Category selection respects the `selected` flag from the feed and toggles it locally when choosing a category.
- Images use `Image.network` with simple error placeholders to avoid crashes on broken links.
- If the detail endpoint fails, the recipe page still shows the tapped recipe’s basic info as a fallback.

## How to run
1. Fetch dependencies: `flutter pub get`
2. Run the app: `flutter run`

## Files touched (overview)
- Models: `lib/models/home_data.dart`, `lib/models/recipe_detail.dart`, `lib/models/recipe.dart`, `lib/models/new_recipe.dart`, `lib/models/ingredient.dart`
- Data access: `lib/repository/home_repository.dart`, `lib/repository/recipe_repository.dart`
- Controllers: `lib/controllers/home_controller.dart`, `lib/controllers/recipe_controller.dart`
- UI: `lib/screens/home_screen.dart`, `lib/screens/recipe_page.dart`, `lib/widgets/*.dart` (header, search bar, menu selector, recipe cards, detail, profile, ingredient list)
