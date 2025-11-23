# Advanced SwiftUI UIKit Navigation Template

A production-ready iOS starter template demonstrating advanced navigation patterns using the **Coordinator Pattern** with **SwiftUI views** and **UIKit navigation**.

## Features

- **Coordinator Pattern Architecture**: Hierarchical navigation management with proper memory handling
- **SwiftUI + UIKit Integration**: SwiftUI views with UIKit navigation controllers
- **MVVM Pattern**: Clean separation between views, view models, and navigation logic
- **Protocol-Based Navigation**: Decoupled navigation using delegate protocols
- **Multiple Navigation Styles**: Support for tab-based, modal, and push navigation
- **Reusable Components**: Shared UI components and coordinator protocols
- **Authentication Flow**: Complete auth flow with login, registration, and email confirmation
- **Tab-Based Main Flow**: Three-tab structure with deep navigation capabilities
- **Nested Navigation**: Smart handling of embedded vs. modal presentation
- **Model Layer Architecture**: Organized data and system layers

## Architecture Overview

### Coordinator Hierarchy
```
ApplicationCoordinator (Root)
├── AuthCoordinator (Login/Register flow)
└── MainCoordinator (Tab-based main app)
    ├── HomeCoordinator
    ├── LocationsCoordinator
    │   └── AccountCoordinator
    └── MoreCoordinator
        ├── LocationsCoordinator
        └── AccountCoordinator
```

### Key Components

- **BaseCoordinator**: Generic coordinator base class with child coordinator management
- **HostingController**: Custom UIHostingController bridging SwiftUI and UIKit
- **BaseViewModel**: Base view model with hosting controller reference
- **ModelLayer**: Three-tier model architecture (ModelLayer → DataLayer/SystemLayer)

## Project Structure

```
Advanced SwiftUI UIKit Nav/
├── Configuration/          # App configuration and setup
├── Coordinators/          # Navigation coordinators
│   ├── Flows/            # Feature-specific coordinators
│   └── Supporting/       # Base classes and protocols
├── Core/                 # Core utilities (HostingController, BaseViewModel)
├── ModelLayer/           # Data and system layers
│   ├── Data Layer/       # Database management
│   └── System Layer/     # UserDefaults and system preferences
├── Screens/              # SwiftUI views and ViewModels
│   ├── Account Screens/  # Account management screens
│   ├── Confirm Email/    # Email confirmation flow
│   ├── Home/            # Home screen
│   ├── Locations/       # Locations list
│   ├── Login/           # Login screen
│   ├── More/            # More menu
│   ├── Register/        # Registration screen
│   └── Upgrade/         # Upgrade/paywall screen
├── Shared Views/         # Reusable UI components
└── Extensions/           # Helper extensions
```

## Getting Started

1. Clone or use this template to create a new repository
2. Open `Advanced SwiftUI UIKit Nav.xcodeproj` in Xcode
3. Build and run the project
4. Start with `ApplicationCoordinator.swift` to understand the navigation flow

## Navigation Patterns

### Adding a New Screen

1. Create SwiftUI View and ViewModel in `Screens/`
2. Add navigation delegate protocol in ViewModel
3. Implement screen presentation in appropriate Coordinator
4. Connect delegate methods to navigation actions

### Creating a New Flow

1. Create a new coordinator inheriting from `BaseCoordinator`
2. Implement the `start()` method
3. Add delegate protocol for completion handling
4. Store and manage child coordinators as needed

## Key Patterns Used

- **Coordinator Pattern**: Navigation logic separation
- **MVVM**: View-ViewModel architecture with SwiftUI
- **Delegate Pattern**: Protocol-based navigation and communication
- **Protocol Composition**: Reusable coordinator functionality through protocols
- **Dependency Injection**: ModelLayer passed through coordinator hierarchy

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## Use Cases

This template is ideal for:
- Apps with complex navigation requirements
- Projects requiring authentication flows
- Tab-based applications with deep navigation
- Apps needing both modal and push navigation
- Teams wanting clean architecture with SwiftUI

## Customization

### Modifying the Model Layer
Edit files in `ModelLayer/` to add your data models, networking, or persistence logic.

### Adding Third-Party Dependencies
Update `AppConfiguration.swift` to initialize libraries like Firebase, analytics, etc.

### Customizing UI
Modify `Shared Views/` components and create your own reusable UI elements.

## License

This template is free to use for any purpose.

## Credits

Created by Robert Barber

