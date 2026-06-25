# ZapShift App Architecture

## 1. App Architecture
- Clean Architecture with a presentation, domain, and data-friendly split.
- GetX handles state, dependency injection, and routing.
- Dio powers API access through a single service layer.
- SharedPreferences stores onboarding, auth, and theme preferences.
- ScreenUtil drives responsive spacing, sizing, and typography.
- CachedNetworkImage, Lottie, and Google Fonts support premium UI polish.

## 2. Folder Structure
- lib/core: constants, helpers, shared extensions, theme tokens.
- lib/config: app bootstrap, environment config, and dependency setup.
- lib/routes: named routes and page registration.
- lib/models: DTOs and UI models for parcels, users, notifications, and services.
- lib/services: API client and local storage wrappers.
- lib/controllers: GetX controllers for app state and feature flows.
- lib/repositories: data access abstractions for auth, parcels, and profile.
- lib/widgets: reusable UI primitives and feature cards.
- lib/screens: all screen implementations grouped by flow.
- lib/theme: Material 3 light and dark theme definitions.

## 3. User Flow
1. Splash loads preferences and decides onboarding, auth, or home.
2. Onboarding explains product value in three premium pages.
3. Login, register, forgot password, and OTP cover account access.
4. Home shows tracking, quick actions, services, and recent parcels.
5. Track parcel reveals live status, rider data, and history.
6. Create parcel walks through sender, receiver, parcel, delivery, payment, and confirmation.
7. Profile and settings expose account, preferences, support, and logout.

## 4. Navigation Flow
- Splash -> Onboarding -> Login/Register -> Home Shell.
- Home Shell bottom navigation: Home, Track, Create Parcel, Notifications, Profile.
- Secondary flows open from actions, cards, and profile menus.
- Named routes keep the app ready for deep links and future expansion.

## 5. UI Design System
- Brand colors: Primary #0A4B50, Accent #D7F25C, Background #F5F7F8, Text #0F172A.
- Material 3 with rounded corners between 16 and 24 px.
- Soft gradients, glassmorphism cards, elevated surfaces, and restrained shadows.
- Typography uses Google Fonts for modern hierarchy and strong readability.
- Motion uses subtle fade, slide, and progress animations instead of noisy effects.
- Dark mode preserves contrast, tone, and brand identity across surfaces.
