# Evencir Flutter Test Task

A Flutter app with four bottom-navigation tabs: Nutrition, Plan, Mood, and Profile.

## 1. Dependencies Used & Why

### Production dependencies

| Package | Why it was used |
| --- | --- |
| `flutter` | Core Flutter SDK for building the UI and app lifecycle. |
| `cupertino_icons` | Provides Cupertino-style icons used by Flutter’s Material/Cupertino widgets. |
| `go_router` | Declarative routing and bottom-tab navigation with `StatefulShellRoute`. |
| `flutter_svg` | Renders SVG icons and illustrations from `assets/svgs/` (nav icons, mood wheel, plan icons, etc.). |
| `table_calendar` | Powers the month calendar in the Nutrition tab’s calendar bottom sheet. |

### Dev dependencies

| Package | Why it was used |
| --- | --- |
| `flutter_test` | Widget and integration tests for key screens and flows. |
| `flutter_lints` | Enforces recommended Dart/Flutter lint rules for code quality. |

## 2. Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Root MaterialApp.router setup
├── core/                     # Shared app-wide code
│   ├── constants/            # App name, asset paths, and static values
│   ├── router/               # go_router config, routes, shell wrapper, guards
│   ├── theme/                # Colors, text styles, and ThemeData
│   └── utils/                # Helpers (date formatting, widget extensions)
├── features/                 # Feature modules (one folder per tab)
│   ├── nutrition/
│   │   └── presentation/
│   │       ├── pages/        # Nutrition screen
│   │       └── widgets/      # Calendar strip, insights, workouts, bottom sheet
│   ├── plan/
│   │   ├── domain/models/    # Training week/day/workout models
│   │   └── presentation/
│   │       ├── pages/        # Training calendar screen
│   │       └── widgets/      # Week section, day row, workout card
│   ├── mood/
│   │   └── presentation/
│   │       └── pages/        # Mood tracking screen
│   └── profile/
│       └── presentation/
│           └── pages/        # Profile screen
└── shared/
    └── widgets/              # Reusable UI used across features (bottom nav bar)

assets/
├── fonts/                    # Mulish font family files
└── svgs/                     # SVG icons and graphics

test/
└── widget_test.dart          # Widget tests for main app flows
```

### Folder purposes

- **`lib/core/`** — Cross-cutting concerns: routing, theming, constants, and utilities not tied to a single feature.
- **`lib/features/`** — Feature-first layout; each tab has its own `presentation` layer (pages and widgets). Plan also includes `domain/models` for training data types.
- **`lib/shared/`** — Components shared by multiple features, such as the bottom navigation bar.
- **`assets/`** — Static resources: custom Mulish fonts and SVG assets referenced via `AppAssets`.
- **`test/`** — Automated widget tests for Nutrition, Plan, Mood, and calendar interactions.
