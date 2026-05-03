# SkinSync Clinic Portal

SkinSync Clinic Portal is a comprehensive management system designed for skin clinics to streamline their operations, manage patient records, handle appointments, and monitor inventory. Built with Flutter, it provides a cross-platform solution for clinic administrators and staff.

## 🚀 Features

- **Advanced Dashboard**: Overview of clinic statistics and daily activities.
- **Appointment Management**: Integrated calendar system for scheduling and tracking patient visits.
- **Patient Management**: Detailed patient records including history, AI-assisted management, and treatment plans.
- **Staff Management**: Role-based access control and staff performance tracking.
- **Treatment Catalog**: Create and manage various skin treatments with dynamic pricing.
- **Inventory Tracking**: Monitor stock levels of clinic supplies and products.
- **Payment & Wallet**: Integrated payment history and wallet management for financial tracking.
- **Two-Factor Authentication**: Enhanced security for staff and administrator accounts.
- **Business Info Management**: Easy updates for clinic details, hours, and settings.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (SDK ^3.10.4)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Backend Services**: [Firebase](https://firebase.google.com/) (Core, Storage)
- **Local Storage**: `shared_preferences`, `flutter_secure_storage`
- **Dependency Injection**: `get_it`
- **UI Components**:
  - `flutter_screenutil` (Responsive design)
  - `table_calendar` (Scheduling)
  - `syncfusion_flutter_signaturepad` (Digital signatures)
  - `flutter_svg` & `iconsax` (Iconography)
  - `google_fonts` (Typography)

## 📁 Project Structure

```text
lib/
├── models/           # Data models and entities
├── repositories/     # Data abstraction layer
├── screens/          # UI screens (Dashboard, Auth, Settings, etc.)
│   └── dashboard/    # Specialized dashboard modules
├── services/         # API, Firebase, and other external services
├── utils/            # Constants, themes, and helper functions
├── view_models/      # Business logic using Riverpod providers
├── widgets/          # Reusable UI components
├── main.dart         # Entry point
└── app_init.dart     # Application initialization logic
```

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK (latest stable version recommended)
- Android Studio / VS Code
- Firebase Project setup

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/skinsync_clinic_portal.git
    cd skinsync_clinic_portal
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Setup Firebase**:
    - Ensure `firebase_options.dart` is correctly configured for your project.
    - Download and place `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in respective directories if not using FlutterFire CLI.

4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🔑 Demo Credentials

For testing purposes, you can use the following credentials:

- **Email**: `micah@yopmail.com`
- **Password**: `Aa!12345`

## 🎨 Design Assets

- **Fonts**: The project uses the **Degular** font family for a premium aesthetic.
- **Icons**: Powered by **Iconsax** and custom SVGs.

## 📄 License

This project is proprietary. All rights reserved.

---
Built with ❤️ by the SkinSync Team.
