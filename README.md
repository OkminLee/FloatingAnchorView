# FloatingAnchorView

A SwiftUI view modifier that adds a floating, draggable view that snaps to corners. Perfect for floating player controls, chat heads, or any persistent UI element that needs to be movable but organized.

## Overview

FloatingAnchorView provides a simple way to add floating views to your SwiftUI application. The floating view can be dragged around the screen and will automatically snap to the nearest corner when released.


https://github.com/user-attachments/assets/f8d6c41b-b3c4-4a47-928e-155428b6c2bd


## Features

- 🎯 Automatic corner snapping
- 🔄 Smooth spring animations
- 📱 Safe area awareness
- 💨 Optimized performance
- 🎨 Fully customizable content
- 📐 Configurable size and padding

## Requirements

- iOS 14.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

### Swift Package Manager

Add FloatingAnchorView to your project through Xcode:
1. File > Add Packages...
2. Enter package URL: `https://github.com/OkminLee/FloatingAnchorView.git`

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/OkminLee/FloatingAnchorView.git", from: "1.0.0")
]
```

## Usage

### Basic Usage

```swift
import FloatingAnchorView

struct ContentView: View {
    var body: some View {
        ZStack {
            // Your main content
        }
        .anchoredFloatingView {
            // Your floating content
            Text("Floating View")
                .padding()
        }
    }
}
```

### Custom Size and Padding

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            // Your main content
        }
        .anchoredFloatingView(
            size: CGSize(width: 200, height: 150),
            padding: 16
        ) {
            VStack {
                Image(systemName: "play.fill")
                Text("Custom Size")
            }
        }
    }
}
```

## Example Use Cases

- Media player controls
- Chat heads
- Quick action buttons
- Mini player views
- Floating toolbars
- Game controls

## Tips

1. **Sizing**: Choose an appropriate size for your floating view that doesn't obstruct too much content
2. **Content**: Keep the floating view content simple and focused
3. **Padding**: Adjust the padding based on your content to ensure it's not too close to screen edges

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
