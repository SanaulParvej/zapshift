import 'package:get/get.dart';

import '../core/app_constants.dart';
import '../screens/app_screens.dart';

abstract final class AppRoutes {
  static const String splash = AppRouteNames.splash;
  static const String onboarding = AppRouteNames.onboarding;
  static const String login = AppRouteNames.login;
  static const String register = AppRouteNames.register;
  static const String forgotPassword = AppRouteNames.forgotPassword;
  static const String otp = AppRouteNames.otp;
  static const String shell = AppRouteNames.shell;
  static const String trackParcel = AppRouteNames.trackParcel;
  static const String parcelDetails = AppRouteNames.parcelDetails;
  static const String createParcel = AppRouteNames.createParcel;
  static const String myParcels = AppRouteNames.myParcels;
  static const String notifications = AppRouteNames.notifications;
  static const String pricing = AppRouteNames.pricing;
  static const String merchantRegistration = AppRouteNames.merchantRegistration;
  static const String becomeRider = AppRouteNames.becomeRider;
  static const String profile = AppRouteNames.profile;
  static const String editProfile = AppRouteNames.editProfile;
  static const String settings = AppRouteNames.settings;
  static const String helpSupport = AppRouteNames.helpSupport;
  static const String aboutUs = AppRouteNames.aboutUs;
}

abstract final class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(name: AppRoutes.otp, page: () => const OtpVerificationScreen()),
    GetPage(name: AppRoutes.shell, page: () => const MainShellScreen()),
    GetPage(name: AppRoutes.trackParcel, page: () => const TrackParcelScreen()),
    GetPage(
      name: AppRoutes.parcelDetails,
      page: () => const ParcelDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.createParcel,
      page: () => const CreateParcelScreen(),
    ),
    GetPage(name: AppRoutes.myParcels, page: () => const MyParcelsScreen()),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsScreen(),
    ),
    GetPage(name: AppRoutes.pricing, page: () => const PricingScreen()),
    GetPage(
      name: AppRoutes.merchantRegistration,
      page: () => const MerchantRegistrationScreen(),
    ),
    GetPage(name: AppRoutes.becomeRider, page: () => const BecomeRiderScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: AppRoutes.helpSupport, page: () => const HelpSupportScreen()),
    GetPage(name: AppRoutes.aboutUs, page: () => const AboutUsScreen()),
  ];
}
