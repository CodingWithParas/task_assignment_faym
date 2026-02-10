# Flutter Product Collections App

A Flutter application that displays a list of product collections using an
accordion-style UI. Each collection is expandable and collapsible, revealing product images 
in a grid layout when expanded.

## Features

✅ Scrollable list of collection cards  
✅ Accordion-style expand/collapse behavior  
✅ Horizontal row of product images in collapsed state  
✅ "+N" overlay showing remaining images count  
✅ Grid layout of all images in expanded state  
✅ Smooth animations during expansion/collapse  
✅ Only one collection expanded at a time  
✅ Rounded corners and subtle elevation on cards  
✅ Network image support with error handling

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/
│   └── collection.dart            # Collection data model
├── screens/
│   └── collections_screen.dart    # Main screen with list of collections
└── widgets/
    └── collection_card.dart       # Reusable accordion card widget
```

### Architecture & Approach

**State Management:**
- Used StatefulWidget for the main screen to manage which collection is expanded
- Only one collection can be expanded at a time (tracked by `expandedIndex`)
- Card expansion state is passed down as props to maintain single source of truth

**UI Components:**
1. **CollectionCard Widget**: Reusable component that handles:
    - Display logic for both collapsed and expanded states
    - Horizontal image preview with "+N" overlay
    - Grid layout for expanded view
    - Tap handling and animation

2. **Animations**:
    - `AnimatedRotation`: Smooth chevron icon rotation (0° → 180°)
    - `AnimatedSize`: Smooth height transitions during expand/collapse
    - Duration: 300ms with easeInOut curve

**Design Decisions:**
- Used `GridView` with 2 columns for expanded state to show images vertically
- Implemented horizontal `ListView` for collapsed preview (max 4 images)
- Added overlay with remaining count (+N) on the last visible image
- Used placeholder images from picsum.photos for demonstration
- Included error handling for network images

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- An Android/iOS emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
cd flutter_collections_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

1. The app launches with a list of 7 product collections
2. Tap any collection header to expand it
3. When expanded, all product images are shown in a 2-column grid
4. Tap the same collection again to collapse it
5. Expanding a different collection automatically collapses the previous one
6. Scroll through the list to see all collections

## Customization

### Adding Your Own Collections

Edit `collections_screen.dart` and modify the `collections` list:

```dart
final List<Collection> collections = [
  Collection(
    id: '1',
    title: 'Your Collection Name',
    productImages: [
      'https://your-image-url-1.jpg',
      'https://your-image-url-2.jpg',
      // Add more image URLs
    ],
  ),
  // Add more collections
];
```

### Changing the Number of Preview Images

In `collection_card.dart`, modify the `maxVisibleImages` constant:

```dart
const int maxVisibleImages = 4; // Change to your preferred number
```

### Styling

- **Card Background**: Change `color` in `CollectionCard` Container decoration
- **Border Radius**: Modify `BorderRadius.circular()` values
- **Grid Columns**: Update `crossAxisCount` in GridView delegate
- **Animation Speed**: Adjust `duration` in AnimatedSize and AnimatedRotation

## Technical Details

### Key Widgets Used

- `ListView.builder`: Efficient scrollable list rendering
- `AnimatedSize`: Smooth height transitions
- `AnimatedRotation`: Chevron icon rotation
- `GridView.builder`: Responsive image grid
- `Stack`: Overlay for "+N" indicator
- `ClipRRect`: Rounded corners for images

### Performance Optimizations

- `shrinkWrap: true` on GridView to avoid nested scrolling issues
- `physics: NeverScrollableScrollPhysics()` on GridView (parent ListView handles scrolling)
- Image error handling to prevent crashes
- Efficient state updates using `setState` only when needed

## Dependencies

- `flutter`: SDK
- `cupertino_icons`: iOS-style icons

## Testing

Run tests with:
```bash
flutter test
```

## Build for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## License

This project is created as part of a Flutter internship assignment.

## Author

Your Name - Paras Sharma

---

**Note**: This implementation uses placeholder images from picsum.photos. Replace them with actual product images for production use.