# Product Catalog

A single-screen Flutter app for browsing a product catalog, built with Material 3. Products are loaded from a local JSON file, so it runs fully offline.

## Features

- Grid and list view toggle (responsive: 2–4 columns by screen width)
- Search by product name or category
- Category filter chips, generated from the data
- Favorites: mark products and filter to favorites only
- Shopping cart with live badge, total price, and a demo checkout
- Product detail bottom sheet
- Loading, error (with retry), and empty states
- Pull-to-refresh

## Project Structure

```
lib/
├── main.dart                     # App setup and catalog screen
├── models/product.dart           # Product model
├── services/product_service.dart # Loads products from assets
└── widgets/
    ├── product_card.dart         # Grid/list product card
    └── product_detail_sheet.dart # Detail bottom sheet
assets/
├── products.json                 # Product data
├── images/                       # Product images
└── icon/                         # App icon
```

## Getting Started

**Requirements:** Flutter SDK with Dart `^3.9.2`

```bash
git clone https://github.com/awaisaltaf5/Flutter_Practice_Code.git
cd Flutter_Practice_Code/product_catalog
flutter pub get
flutter run
```

## Customizing the Catalog

Edit `assets/products.json` and add images to `assets/images/`. Each product uses this format:

```json
{
  "id": "1",
  "name": "Wireless Over-Ear Headphones",
  "category": "Electronics",
  "price": 129.99,
  "image": "assets/images/headphones.jpg",
  "rating": 4.7,
  "description": "..."
}
```

## Author

Muhammad Awais Altaf — [GitHub](https://github.com/awaisaltaf5)
