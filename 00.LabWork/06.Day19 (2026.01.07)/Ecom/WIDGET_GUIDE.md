# Complete Widget Usage Guide

This document explains where and how each Flutter widget is used in the e-commerce application.

## 📋 Table of Contents
1. [Scaffold](#scaffold)
2. [Column](#column)
3. [Row](#row)
4. [Container](#container)
5. [NetworkImage](#networkimage)
6. [AssetImage](#assetimage)
7. [Buttons](#buttons)
8. [Icons](#icons)
9. [child vs children](#child-vs-children)

---

## 1. Scaffold 🏗️

**Location**: Main widget wrapper (line ~90)

**Purpose**: Provides the basic material design visual layout structure.

**Usage in App**:
```dart
Scaffold(
  appBar: AppBar(...),           // Top bar with title and actions
  body: Column(...),              // Main content area
  bottomNavigationBar: ...,       // Bottom navigation
  floatingActionButton: ...,      // Floating offers button
)
```

**Components**:
- **AppBar**: Shows "Shopping Store" title, cart icon, notification icon
- **Body**: Contains all the main content (search, categories, products)
- **BottomNavigationBar**: Navigation between Home, Categories, Wishlist, Profile
- **FloatingActionButton**: Shows special offers dialog

---

## 2. Column 📊

**Multiple Locations**: Used for vertical arrangements

### Main Body Column (line ~112)
```dart
Column(
  children: [
    Container(...),    // Search bar section
    Container(...),    // Categories section
    Padding(...),      // Products header
    Expanded(...),     // Products grid
  ],
)
```

### Product Card Column (line ~336)
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(...),     // Product image
    Expanded(...),     // Product details
  ],
)
```

### Product Details Column (line ~387)
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(...),         // Product name
    Row(...),          // Rating stars
    Spacer(),          // Flexible space
    Row(...),          // Price and button
  ],
)
```

### Dialog Column (line ~288)
```dart
Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('🎉 Get 20% off...'),
    Text('🎁 Free shipping...'),
    Text('⭐ Buy 2 Get 1...'),
  ],
)
```

**Key Points**:
- Use `children` parameter (plural) for multiple widgets
- `crossAxisAlignment` controls horizontal alignment
- `mainAxisAlignment` controls vertical spacing

---

## 3. Row ↔️

**Multiple Locations**: Used for horizontal arrangements

### Search Bar Row (line ~122)
```dart
Row(
  children: [
    Expanded(           // Takes remaining space
      child: Container(...)  // Search field
    ),
    SizedBox(width: 10),
    Container(...)      // Filter button
  ],
)
```

### Products Header Row (line ~175)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Featured Products'),
    TextButton(...),    // "See All" button
  ],
)
```

### Rating Row (line ~408)
```dart
Row(
  children: [
    Icon(Icons.star, ...),
    SizedBox(width: 4),
    Text('4.5'),
    SizedBox(width: 4),
    Text('(450 reviews)'),
  ],
)
```

### Price and Button Row (line ~427)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('\$999'),      // Price
    Container(...)      // Add to cart button
  ],
)
```

### AppBar Actions Row (line ~103)
```dart
actions: [
  Stack(...),          // Cart with badge
  IconButton(...),     // Notifications
]
```

### Dialog Title Row (line ~280)
```dart
Row(
  children: [
    Icon(Icons.local_offer),
    SizedBox(width: 10),
    Text('Special Offers'),
  ],
)
```

**Key Points**:
- Use `children` parameter for multiple widgets
- `mainAxisAlignment` controls horizontal spacing
- Use `Expanded` for responsive sizing

---

## 4. Container 📦

**Multiple Locations**: Most frequently used widget

### Search Bar Container (line ~115)
```dart
Container(
  padding: EdgeInsets.all(16),
  color: Colors.blue.shade50,
  child: Row(...)
)
```

### Search Field Container (line ~124)
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [BoxShadow(...)],
  ),
  child: TextField(...)
)
```

### Filter Button Container (line ~139)
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(15),
  ),
  child: IconButton(...)
)
```

### Categories Container (line ~149)
```dart
Container(
  height: 60,
  padding: EdgeInsets.symmetric(vertical: 10),
  child: ListView.builder(...)
)
```

### Product Card Container (line ~327)
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [BoxShadow(...)],
  ),
  child: Column(...)
)
```

### Product Image Container (line ~338)
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.vertical(...),
    image: DecorationImage(
      image: NetworkImage(...),
      fit: BoxFit.cover,
    ),
  ),
  child: Stack(...)
)
```

### Badge Container (line ~231)
```dart
Container(
  padding: EdgeInsets.all(4),
  decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
  ),
  child: Text('$_cartCount')
)
```

### Favorite Button Container (line ~353)
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  ),
  child: IconButton(...)
)
```

### Discount Badge Container (line ~366)
```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('20% OFF')
)
```

### Add to Cart Button Container (line ~431)
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: IconButton(...)
)
```

**Key Properties**:
- `padding`: Internal spacing
- `margin`: External spacing
- `decoration`: BoxDecoration for styling
- `child`: Single widget inside (singular)
- `color`: Background color
- `height`/`width`: Size constraints

---

## 5. NetworkImage 🌐

**Location**: Product cards (line ~342)

**Purpose**: Load images from the internet

**Usage**:
```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(product['image']),
      fit: BoxFit.cover,
    ),
  ),
)
```

**Product Image URLs**:
```dart
final List<Map<String, dynamic>> products = [
  {
    'image': 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400',
  },
  // More products...
];
```

**Benefits**:
- ✅ Loads images from URLs
- ✅ Automatic caching
- ✅ No asset management needed
- ✅ Easy to update images

**Note**: Requires internet connection to load images.

---

## 6. AssetImage 📁

**Currently NOT implemented but documented**

**How to Add**:

**Step 1**: Create folder structure
```
ecommerce_app/
├── assets/
│   └── images/
│       ├── laptop.png
│       ├── phone.png
│       └── headphones.png
```

**Step 2**: Update pubspec.yaml
```yaml
flutter:
  assets:
    - assets/images/
```

**Step 3**: Use in code
```dart
// Method 1: Direct Image widget
Image.asset('assets/images/laptop.png')

// Method 2: In DecorationImage
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/laptop.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

**Benefits**:
- ✅ Works offline
- ✅ Faster loading
- ✅ Bundled with app
- ✅ No internet required

---

## 7. Buttons 🔘

### ElevatedButton (Categories)
**Location**: Line ~158

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: Text('Electronics'),
)
```

### IconButton (Multiple Locations)

**Cart Button** (line ~215)
```dart
IconButton(
  icon: Icon(Icons.shopping_cart),
  onPressed: () {},
)
```

**Notification Button** (line ~248)
```dart
IconButton(
  icon: Icon(Icons.notifications_outlined),
  onPressed: () {},
)
```

**Filter Button** (line ~141)
```dart
IconButton(
  icon: Icon(Icons.filter_list, color: Colors.white),
  onPressed: () {},
)
```

**Favorite Button** (line ~355)
```dart
IconButton(
  icon: Icon(Icons.favorite_border, color: Colors.red),
  onPressed: () {},
)
```

**Add to Cart Button** (line ~433)
```dart
IconButton(
  icon: Icon(Icons.add_shopping_cart),
  onPressed: _addToCart,
)
```

### TextButton
**Location**: Line ~180

```dart
TextButton(
  onPressed: () {},
  child: Text('See All'),
)
```

### FloatingActionButton
**Location**: Line ~258

```dart
FloatingActionButton(
  onPressed: () {
    showDialog(...);  // Shows offers dialog
  },
  child: Icon(Icons.local_offer),
)
```

**Button Types Summary**:
| Button Type | Use Case | Style |
|-------------|----------|-------|
| ElevatedButton | Primary actions | Raised, filled |
| IconButton | Icon actions | Transparent |
| TextButton | Secondary actions | Flat, text only |
| FloatingActionButton | Main action | Circular, floating |

---

## 8. Icons 🎨

**All Icon Usage**:

### Navigation Icons
```dart
Icons.home              // Home tab
Icons.category          // Categories tab
Icons.favorite_outline  // Wishlist tab
Icons.person_outline    // Profile tab
```

### Action Icons
```dart
Icons.shopping_cart     // Cart button
Icons.notifications_outlined  // Notifications
Icons.search            // Search field
Icons.filter_list       // Filter button
Icons.local_offer       // Offers FAB
```

### Product Icons
```dart
Icons.favorite_border   // Add to favorites
Icons.star              // Rating star
Icons.add_shopping_cart // Add to cart
```

**Icon Properties**:
```dart
Icon(
  Icons.star,
  color: Colors.amber,      // Icon color
  size: 16,                 // Icon size
)
```

---

## 9. child vs children 👨‍👩‍👧‍👦

### Widgets Using `child` (Singular)

**Container**
```dart
Container(
  child: Text('Single widget'),  // ✅ child
)
```

**Expanded**
```dart
Expanded(
  child: GridView(...),  // ✅ child
)
```

**Center**
```dart
Center(
  child: Text('Centered'),  // ✅ child
)
```

**Padding**
```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Row(...),  // ✅ child
)
```

### Widgets Using `children` (Plural)

**Column**
```dart
Column(
  children: [  // ✅ children (list)
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```

**Row**
```dart
Row(
  children: [  // ✅ children (list)
    Icon(Icons.star),
    Text('Rating'),
  ],
)
```

**Stack**
```dart
Stack(
  children: [  // ✅ children (list)
    Image(...),
    Positioned(...),
  ],
)
```

**ListView**
```dart
ListView(
  children: [  // ✅ children (list)
    ListTile(...),
    ListTile(...),
  ],
)
```

**Rule**: 
- Use `child` when widget accepts ONE widget
- Use `children` when widget accepts MULTIPLE widgets

---

## 🎯 Quick Reference

### Most Used Widgets in Order:
1. **Container** (20+ times) - Styling and layout
2. **Row** (10+ times) - Horizontal layouts
3. **Column** (5+ times) - Vertical layouts
4. **Icon** (15+ times) - Visual indicators
5. **IconButton** (10+ times) - Clickable icons
6. **Text** (30+ times) - Display text
7. **NetworkImage** (6 times) - Product images
8. **ElevatedButton** (6 times) - Category buttons

### Widget Relationships:
```
Scaffold (parent)
└── Column (child)
    ├── Container (child 1)
    │   └── Row (child)
    │       ├── Expanded (child 1)
    │       │   └── Container (child)
    │       └── Container (child 2)
    ├── Container (child 2)
    ├── Padding (child 3)
    └── Expanded (child 4)
        └── GridView (child)
            └── Container (items)
                └── Column (child)
                    ├── Expanded (child 1)
                    └── Expanded (child 2)
```

---

## 📝 Summary

✅ **Scaffold**: App structure (1 usage)  
✅ **Column**: Vertical layouts (5+ usages)  
✅ **Row**: Horizontal layouts (10+ usages)  
✅ **Container**: Styling & decoration (20+ usages)  
✅ **NetworkImage**: Loading images from URLs (6 usages)  
✅ **AssetImage**: Documented for local images  
✅ **Buttons**: ElevatedButton, IconButton, TextButton, FAB (20+ usages)  
✅ **Icons**: Various material icons (15+ usages)  
✅ **child**: For single widget (many usages)  
✅ **children**: For multiple widgets (many usages)  

**Every required widget is demonstrated with practical examples!**

---

*This guide is part of the E-Commerce Flutter Application tutorial*
