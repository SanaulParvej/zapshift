import 'package:flutter/material.dart';

class AppStrings {
  static const String appName = 'ZapShift';
  static const String appTagline = 'Fast, clear, premium delivery operations.';
  static const String tagline = appTagline;
  static const String supportEmail = 'support@zapshift.com';
  static const String supportPhone = '+880 1700 000 000';
  static const String baseAddress = 'Dhaka, Bangladesh';
}

class AppRouteNames {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String shell = '/shell';
  static const String trackParcel = '/track-parcel';
  static const String parcelDetails = '/parcel-details';
  static const String createParcel = '/create-parcel';
  static const String myParcels = '/my-parcels';
  static const String notifications = '/notifications';
  static const String pricing = '/pricing';
  static const String merchantRegistration = '/merchant-registration';
  static const String becomeRider = '/become-rider';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String helpSupport = '/help-support';
  static const String aboutUs = '/about-us';
}

class AppColors {
  static const Color primary = Color(0xFF0A4B50);
  static const Color accent = Color(0xFFD7F25C);
  static const Color background = Color(0xFFF5F7F8);
  static const Color textDark = Color(0xFF0F172A);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color muted = Color(0xFF64748B);
  static const Color border = Color(0xFFE2E8F0);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFDC2626);
  static const Color info = Color(0xFF0284C7);
  static const Color darkBackground = Color(0xFF071A1D);
  static const Color darkSurface = Color(0xFF0F262A);
}

class AppRadii {
  static const double xl = 24;
  static const double lg = 20;
  static const double md = 16;
  static const double sm = 12;
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppGradients {
  static const LinearGradient hero = LinearGradient(
    colors: [Color(0xFF0A4B50), Color(0xFF115E59), Color(0xFF163A3F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accent = LinearGradient(
    colors: [Color(0xFFD7F25C), Color(0xFFF4FFB5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient surface = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF7FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppDurations {
  static const Duration short = Duration(milliseconds: 220);
  static const Duration medium = Duration(milliseconds: 350);
  static const Duration long = Duration(milliseconds: 600);
}

class AppRemoteAssets {
  static const String splashLottie =
      'https://assets9.lottiefiles.com/packages/lf20_2h1mgzrc.json';
  static const String onboardingOneLottie =
      'https://assets9.lottiefiles.com/packages/lf20_6o3q7vga.json';
  static const String onboardingTwoLottie =
      'https://assets1.lottiefiles.com/packages/lf20_v9xk4qf1.json';
  static const String onboardingThreeLottie =
      'https://assets10.lottiefiles.com/packages/lf20_vfym5g8l.json';
}
