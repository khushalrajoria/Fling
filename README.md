# Fling - Your Ultimate Dating App

Welcome to Fling, where dating meets customization with unique features for country preferences and detailed gender selections.

## Table of Contents
- [System Requirements](#system-requirements)
- [Figma Design Guidelines for Better UI Accuracy](#figma-design-guidelines-for-better-ui-accuracy)
- [Checking the UI of the Entire App](#checking-the-ui-of-the-entire-app)
- [Application Structure](#application-structure)
- [Code Formatting Guidelines](#code-formatting-guidelines)
- [Improving Code Readability](#improving-code-readability)
- [Libraries and Tools Used](#libraries-and-tools-used)
- [Support](#support)

---

## System Requirements

Ensure your development environment meets the following prerequisites:

- Dart SDK Version 3.3.2 or greater
- Flutter SDK Version 3.19.4 or greater

---

## Figma Design Guidelines for Better UI Accuracy

To ensure accurate design-to-code conversion and a seamless user experience, refer to our design guidelines [here](https://docs.dhiwise.com/docs/Designguidelines/intro).

---

## Checking the UI of the Entire App

Efficiently navigate through all app screens by setting the 'initialRoute' to 'AppNavigation' in the 'AppRoutes.dart' file.

---

## Application Structure

After a successful build, your application structure should resemble the following:

```
.
├── android               - Android platform files
├── assets                - Images and fonts
├── ios                   - iOS platform files
├── lib
│   ├── main.dart         - Entry point of the application
│   ├── core
│   │   ├── app_export.dart   - Common imports
│   │   ├── constants         - Static constants
│   │   └── utils             - Utility functions
│   ├── presentation          - Screen widgets
│   ├── routes                - Application routes
│   ├── theme                 - App themes and decorations
│   └── widgets               - Custom widgets
```

---

## Code Formatting Guidelines

Ensure your code is properly formatted using the following command:
```bash
dart format .
```

---

## Improving Code Readability

Enhance code readability by addressing all errors and warnings within the application.

---

## Libraries and Tools Used

- **Provider** - State management library ([Link](https://pub.dev/packages/provider))
- **cached_network_image** - Image caching for internet images ([Link](https://pub.dev/packages/cached_network_image))

---
