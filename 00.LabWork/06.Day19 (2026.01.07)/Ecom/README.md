# E-Commerce Flutter Application

A simple e-commerce application demonstrating essential Flutter widgets including Column, Row, Container, Scaffold, NetworkImage, AssetImage, Buttons, and Icons.

## 📚 Flutter Widgets Demonstrated

This application showcases the following Flutter widgets and concepts:

### 1. **Scaffold**
The base structure of the app providing:
- AppBar with title and actions
- Body section
- BottomNavigationBar
- FloatingActionButton

```dart
Scaffold(
  appBar: AppBar(...),
  body: Column(...),
  bottomNavigationBar: BottomNavigationBar(...),
  floatingActionButton: FloatingActionButton(...),
)
```

### 2. **Column**
Vertically arranged children widgets:
- Search bar section
- Categories list
- Products header
- Products grid

```dart
Column(
  children: [
    Container(...), // Search bar
    Container(...), // Categories
    Padding(...),   // Header
    Expanded(...),  // Products grid
  ],
)
```

### 3. **Row**
Horizontally arranged children widgets:
- Search bar with filter button
- Product price and add button
- Rating stars
- Header with "See All" button

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Featured Products'),
    TextButton(...),
  ],
)
```

### 4. **Container**
Used extensively for:
- Styling and decorating widgets
- Adding padding and margins
- Creating backgrounds
- Rounded corners and shadows

```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [BoxShadow(...)],
  ),
  child: ...
)
```

### 5. **NetworkImage**
Loading images from the internet:
- Product images from Unsplash
- Used in DecorationImage
- Automatic caching

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('https://...'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### 6. **AssetImage** (How to use)
To use local images instead of network images:

1. Add images to `assets/images/` folder
2. Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```
3. Use in code:
```dart
Image.asset('assets/images/product.png')
// OR
DecorationImage(
  image: AssetImage('assets/images/product.png'),
)
```

### 7. **Buttons**
Multiple button types used:

#### ElevatedButton (Categories)
```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(...),
  child: Text('Category'),
)
```

#### IconButton (Cart, Notifications, Favorites)
```dart
IconButton(
  icon: Icon(Icons.shopping_cart),
  onPressed: () {},
)
```

#### TextButton (See All)
```dart
TextButton(
  onPressed: () {},
  child: Text('See All'),
)
```

#### FloatingActionButton (Offers)
```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.local_offer),
)
```

### 8. **Icons**
Various icons used throughout:
- `Icons.shopping_cart` - Shopping cart
- `Icons.search` - Search
- `Icons.filter_list` - Filter
- `Icons.favorite_border` - Wishlist
- `Icons.star` - Rating
- `Icons.add_shopping_cart` - Add to cart
- `Icons.home`, `Icons.category`, `Icons.person_outline` - Navigation

```dart
Icon(
  Icons.star,
  color: Colors.amber,
  size: 16,
)
```

### 9. **child vs children**

#### Single child (using `child`)
```dart
Container(
  child: Text('Single widget'),
)
```

#### Multiple children (using `children`)
```dart
Column(
  children: [
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```

## 🎨 App Features

### Home Screen
- ✅ Search bar with filter button
- ✅ Horizontal scrolling categories
- ✅ Product grid with images
- ✅ Shopping cart badge counter
- ✅ Bottom navigation
- ✅ Floating action button for offers

### Product Card Features
- NetworkImage for product photos
- Favorite button (heart icon)
- Discount badge
- Star rating display
- Price display
- Add to cart button
- Hover effects with shadows

### Interactive Elements
- Cart counter updates on adding items
- Snackbar notification on cart add
- Special offers dialog
- Category selection
- Bottom navigation bar

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Internet connection (for NetworkImage to load)
- An IDE (VS Code, Android Studio)

### Installation

1. **Navigate to project directory:**
```bash
cd ecommerce_app
```

2. **Get dependencies:**
```bash
flutter pub get
```

3. **Run the application:**
```bash
flutter run
```

## 📱 Screen Sections Breakdown

### AppBar Section
```dart
AppBar(
  title: Text('Shopping Store'),
  actions: [
    // Cart icon with badge
    // Notification icon
  ],
)
```

### Search Section
- Uses Row with Expanded for responsive search bar
- Container for styling
- TextField for input
- IconButton for filter

### Categories Section
- Horizontal ListView
- ElevatedButtons for categories
- Active state highlighting

### Products Grid
- GridView.builder for 2-column layout
- Custom product cards
- NetworkImage for product photos
- Interactive buttons

### Bottom Navigation
- 4 tabs: Home, Categories, Wishlist, Profile
- Icon and label for each tab
- Active state indicator

## 🎯 Widget Usage Summary

| Widget | Count | Purpose |
|--------|-------|---------|
| Scaffold | 1 | Main app structure |
| Column | 5+ | Vertical layouts |
| Row | 10+ | Horizontal layouts |
| Container | 20+ | Styling & decoration |
| NetworkImage | 6 | Product images |
| Icon | 15+ | Visual indicators |
| ElevatedButton | 6 | Category buttons |
| IconButton | 10+ | Action buttons |
| TextButton | 1 | "See All" link |
| FloatingActionButton | 1 | Offers button |

## 📖 Learning Points

### 1. Layout Structure
```
Scaffold
└── Column (main body)
    ├── Container (search section)
    │   └── Row
    │       ├── Expanded (search field)
    │       └── IconButton (filter)
    ├── Container (categories)
    │   └── ListView (horizontal)
    ├── Padding (header)
    │   └── Row
    └── Expanded (products)
        └── GridView
```

### 2. Child vs Children
- Use `child` when widget accepts ONE child
- Use `children` when widget accepts MULTIPLE children
- Examples: Container uses `child`, Column uses `children`

### 3. Image Loading
- **NetworkImage**: Loads from URL (requires internet)
- **AssetImage**: Loads from local assets (faster, offline)

### 4. Container Power
Container is versatile for:
- Padding/Margin
- Background colors
- Border radius
- Shadows
- Gradients
- Constraints

### 5. Responsive Design
- Use `Expanded` for flexible sizing
- Use `Flexible` for proportional sizing
- Use `MediaQuery` for screen dimensions

## 🎨 Customization

### Change Product Images
Replace the NetworkImage URLs in the `products` list:
```dart
final List<Map<String, dynamic>> products = [
  {
    'name': 'Your Product',
    'price': '\$99',
    'image': 'YOUR_IMAGE_URL',
    'rating': 4.5,
  },
];
```

### Add More Categories
Add items to the `categories` list:
```dart
final List<String> categories = [
  'All',
  'Electronics',
  'Your Category',
];
```

### Change Colors
Modify the theme:
```dart
theme: ThemeData(
  primarySwatch: Colors.purple, // Change primary color
  useMaterial3: true,
)
```

## 🐛 Common Issues & Solutions

### Issue: Images not loading
**Solution**: Check internet connection or use valid image URLs

### Issue: Asset images not found
**Solution**: 
1. Create `assets/images/` folder
2. Add images to folder
3. Update `pubspec.yaml`
4. Run `flutter pub get`

### Issue: Layout overflow
**Solution**: Use `Expanded` or `Flexible` widgets

## 📝 Assignment Checklist

- ✅ Scaffold implementation
- ✅ Column with multiple children
- ✅ Row with multiple children
- ✅ Container for styling
- ✅ NetworkImage for loading images
- ✅ AssetImage documentation
- ✅ Multiple button types (Elevated, Icon, Text, Floating)
- ✅ Icons throughout the app
- ✅ child vs children demonstration
- ✅ Professional UI design

## 🎓 Key Concepts Learned

1. **Widget Tree**: How widgets nest inside each other
2. **Layout Widgets**: Column, Row, Expanded, Flexible
3. **Styling**: Container, BoxDecoration, BorderRadius
4. **Images**: NetworkImage vs AssetImage
5. **Interactivity**: Buttons, IconButtons, GestureDetector
6. **State Management**: StatefulWidget with setState
7. **Material Design**: Following design guidelines

## 🚀 Next Steps

To enhance this app, you can add:
- Product detail page
- Real shopping cart functionality
- User authentication
- Search functionality
- Filters and sorting
- Payment integration
- Order history
- User reviews

## 📞 Support

For Flutter documentation:
- Official docs: https://docs.flutter.dev
- Widget catalog: https://docs.flutter.dev/development/ui/widgets
- Layout tutorial: https://docs.flutter.dev/development/ui/layout

---

**Made with ❤️ using Flutter**

*Perfect for learning Flutter widgets and building e-commerce apps!*
