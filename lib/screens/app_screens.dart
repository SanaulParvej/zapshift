import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/app_controllers.dart';
import '../core/app_constants.dart';
import '../models/demo_data.dart';
import '../routes/app_pages.dart';
import '../widgets/app_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SplashController>().bootstrap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.hero),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BrandLogo(size: 86),
                SizedBox(height: 22.h),
                Text(
                  AppStrings.appName,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.tagline,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withValues(alpha: 0.82),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 220.h,
                  child: Lottie.network(
                    AppRemoteAssets.splashLottie,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(24.r),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_shipping_rounded,
                            size: 80.r,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Premium parcel operations, designed for speed and clarity.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withValues(alpha: 0.84),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 18.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BrandHeader(
                    title: AppStrings.appName,
                    subtitle: 'Premium delivery for modern teams',
                  ),
                  TextButton(
                    onPressed: controller.skip,
                    child: const Text('Skip'),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: DemoData.onboarding.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final item = DemoData.onboarding[index];
                    return AppCard(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF8FBFC), Color(0xFFE8F5F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 260.h,
                            child: Lottie.network(
                              item.lottieUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                IconData iconData;
                                if (index == 0) {
                                  iconData = Icons.explore_rounded;
                                } else if (index == 1) {
                                  iconData = Icons.storefront_rounded;
                                } else {
                                  iconData = Icons.two_wheeler_rounded;
                                }
                                return Center(
                                  child: Container(
                                    padding: EdgeInsets.all(40.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.05),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      iconData,
                                      size: 100.r,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              item.accent,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            item.subtitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(height: 1.55),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 18.h),
              Obx(
                () => PageDots(
                  count: DemoData.onboarding.length,
                  activeIndex: controller.currentPage.value,
                ),
              ),
              SizedBox(height: 18.h),
              Obx(
                () => PremiumButton(
                  text:
                      controller.currentPage.value ==
                          DemoData.onboarding.length - 1
                      ? 'Get Started'
                      : 'Next',
                  onPressed: controller.nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthLayout extends StatelessWidget {
  const _AuthLayout({
    required this.title,
    required this.subtitle,
    required this.body,
    this.footer,
  });

  final String title;
  final String subtitle;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandHeader(
                title: AppStrings.appName,
                subtitle: 'Courier and parcel delivery company',
              ),
              SizedBox(height: 18.h),
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 8.h),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 18.h),
              AppCard(child: body),
              if (footer != null) ...[SizedBox(height: 18.h), footer!],
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return _AuthLayout(
      title: 'Welcome back',
      subtitle: 'Sign in to manage deliveries and continue where you left off.',
      body: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            AppTextField(
              controller: controller.loginEmailController,
              hintText: 'Email address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 14.h),
            Obx(
              () => AppTextField(
                controller: controller.loginPasswordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: controller.obscurePassword.value,
                suffixIcon: Icon(
                  controller.obscurePassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onSuffixTap: () => controller.obscurePassword.toggle(),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                child: const Text('Forgot password?'),
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => PremiumButton(
                text: 'Sign In',
                loading: controller.loading.value,
                onPressed: controller.login,
              ),
            ),
            SizedBox(height: 12.h),
            SecondaryButton(
              text: 'Create new account',
              onPressed: () => Get.toNamed(AppRoutes.register),
            ),
          ],
        ),
      ),
      footer: const _AuthFooter(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return _AuthLayout(
      title: 'Create account',
      subtitle: 'Merchant or individual user onboarding.',
      body: Form(
        key: controller.registerFormKey,
        child: Column(
          children: [
            AppTextField(
              controller: controller.registerNameController,
              hintText: 'Full name',
              prefixIcon: Icons.person_outline,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.registerPhoneController,
              hintText: 'Phone number',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.registerEmailController,
              hintText: 'Email address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 14.h),
            Obx(
              () => AppTextField(
                controller: controller.registerPasswordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: controller.obscurePassword.value,
                suffixIcon: Icon(
                  controller.obscurePassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onSuffixTap: () => controller.obscurePassword.toggle(),
              ),
            ),
            SizedBox(height: 18.h),
            Obx(
              () => PremiumButton(
                text: 'Create Account',
                loading: controller.loading.value,
                onPressed: controller.register,
              ),
            ),
            SizedBox(height: 12.h),
            SecondaryButton(
              text: 'Already have an account',
              onPressed: Get.back,
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return _AuthLayout(
      title: 'Reset password',
      subtitle: 'We will send a verification code to your email address.',
      body: Form(
        key: controller.forgotFormKey,
        child: Column(
          children: [
            AppTextField(
              controller: controller.forgotEmailController,
              hintText: 'Email address',
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 18.h),
            Obx(
              () => PremiumButton(
                text: 'Send code',
                loading: controller.loading.value,
                onPressed: controller.sendOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return _AuthLayout(
      title: 'Verify OTP',
      subtitle: 'Enter the code sent to your email to continue.',
      body: Form(
        key: controller.otpFormKey,
        child: Column(
          children: [
            AppTextField(
              controller: controller.otpController,
              hintText: '6-digit OTP',
              prefixIcon: Icons.pin_outlined,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18.h),
            Obx(
              () => PremiumButton(
                text: 'Verify and continue',
                loading: controller.loading.value,
                onPressed: controller.verifyOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthFooter extends StatelessWidget {
  const _AuthFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Theme.of(context).dividerColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Trusted delivery flow',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Expanded(child: Divider(color: Theme.of(context).dividerColor)),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'ZapShift is ready for production API integration.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    const tabs = [
      HomeScreen(),
      TrackParcelScreen(),
      CreateParcelScreen(compact: true),
      NotificationsScreen(),
      ProfileScreen(),
    ];

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: appController.bottomNavIndex.value,
          children: tabs,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: appController.bottomNavIndex.value,
          onDestinationSelected: appController.setBottomNavIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.track_changes_outlined),
              selectedIcon: Icon(Icons.track_changes_rounded),
              label: 'Track',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline_rounded),
              selectedIcon: Icon(Icons.add_circle_rounded),
              label: 'Create',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none_rounded),
              selectedIcon: Icon(Icons.notifications_rounded),
              label: 'Alerts',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final appController = Get.find<AppController>();

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 24.h),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning, ${appController.userProfile.value.name.split(' ').first}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Deliver with clarity.',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: appController.toggleTheme,
                child: const BrandLogo(),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          HeroBanner(
            badge: 'Track live',
            title: 'Search any parcel and follow it in real time',
            subtitle:
                'Fast tracking, transparent ETA, and polished parcel status updates.',
            actionText: 'Track parcel',
            onActionTap: () => Get.toNamed(AppRoutes.trackParcel),
            trailing: SizedBox(
              height: 120.h,
              child: Lottie.network(
                AppRemoteAssets.onboardingOneLottie,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.near_me_rounded,
                      size: 48.r,
                      color: AppColors.accent,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 18.h),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search tracking number',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 12.h),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter tracking number',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          PremiumButton(
            text: 'Track Parcel',
            onPressed: () => Get.toNamed(AppRoutes.trackParcel),
          ),
          SizedBox(height: 22.h),
          const SectionHeader(
            title: 'Quick actions',
            subtitle: 'Most used ZapShift flows',
          ),
          SizedBox(height: 14.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.quickActions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (_, index) {
              final item = homeController.quickActions[index];
              return QuickActionCard(
                title: item.title,
                subtitle: item.subtitle,
                icon: item.icon,
                colors: item.gradient,
                onTap: () => _handleAction(item.action),
              );
            },
          ),
          SizedBox(height: 22.h),
          const SectionHeader(
            title: 'Services',
            subtitle: 'Everything in one elegant dashboard',
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 220.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: homeController.services
                  .map(
                    (item) => ServiceStripCard(
                      item: item,
                      onTap: () => _handleAction(item.action),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 22.h),
          const SectionHeader(
            title: 'Why choose us',
            subtitle: 'Built for trust, speed and clarity',
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: MetricTile(
                  title: 'On-time pickup',
                  value: '98%',
                  icon: Icons.schedule_rounded,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: MetricTile(
                  title: 'Support response',
                  value: '<3m',
                  icon: Icons.support_agent_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: MetricTile(
                  title: 'Satisfied users',
                  value: '12K+',
                  icon: Icons.thumb_up_alt_rounded,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: MetricTile(
                  title: 'Live riders',
                  value: '450+',
                  icon: Icons.delivery_dining_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          AppCard(
            gradient: const LinearGradient(
              colors: [Color(0xFFECFDF5), Color(0xFFF8FFEB)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Live tracking',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  'See movement, route status and ETA changes instantly.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 14.h),
                const LinearProgressIndicator(value: 0.78, minHeight: 10),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          AppCard(
            gradient: const LinearGradient(
              colors: [Color(0xFFF7FAFC), Color(0xFFEEF7F6)],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Safe delivery',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Verification, rider transparency and proof of delivery.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.verified_rounded,
                  size: 54.r,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 22.h),
          const SectionHeader(
            title: 'Customer reviews',
            subtitle: 'Recent voices from merchants and riders',
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 170.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => SizedBox(
                width: 290.w,
                child: ReviewCardView(review: homeController.reviews[index]),
              ),
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemCount: homeController.reviews.length,
            ),
          ),
          SizedBox(height: 22.h),
          SectionHeader(
            title: 'Recent parcels',
            subtitle: 'A quick look at your latest deliveries',
            actionLabel: 'See all',
            onActionTap: () => Get.toNamed(AppRoutes.myParcels),
          ),
          SizedBox(height: 12.h),
          ...homeController.recentParcels.map(
            (parcel) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ParcelCardView(
                parcel: parcel,
                onTap: () => Get.toNamed(AppRoutes.parcelDetails),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleAction(ServiceAction action) {
    switch (action) {
      case ServiceAction.sendParcel:
      case ServiceAction.expressDelivery:
      case ServiceAction.nationwideDelivery:
      case ServiceAction.cashOnDelivery:
      case ServiceAction.parcelReturn:
        Get.toNamed(AppRoutes.createParcel);
        return;
      case ServiceAction.becomeRider:
        Get.toNamed(AppRoutes.becomeRider);
        return;
      case ServiceAction.merchantService:
      case ServiceAction.fulfillmentSolution:
      case ServiceAction.corporateService:
        Get.toNamed(AppRoutes.merchantRegistration);
        return;
      case ServiceAction.pricing:
        Get.toNamed(AppRoutes.pricing);
        return;
    }
  }
}

class TrackParcelScreen extends StatelessWidget {
  const TrackParcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TrackController>();
    final canPop = Navigator.canPop(context);
    return Scaffold(
      appBar: canPop
          ? AppBar(
              title: const Text('Track Parcel'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            )
          : null,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 24.h),
          children: [
            if (!canPop) ...[
              const BrandHeader(
                title: 'Track parcel',
                subtitle: 'Search by tracking number',
              ),
              SizedBox(height: 16.h),
            ],
            AppCard(
              child: Column(
                children: [
                  AppTextField(
                    controller: controller.searchController,
                    hintText: 'Enter tracking number',
                    prefixIcon: Icons.search_rounded,
                  ),
                  SizedBox(height: 14.h),
                  Obx(
                    () => PremiumButton(
                      text: 'Search parcel',
                      loading: controller.searching.value,
                      onPressed: controller.searchParcel,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Obx(() {
              final parcel = controller.selectedParcel.value;
              if (parcel == null) {
                return const SizedBox.shrink();
              }
              return Column(
                children: [
                  AppCard(
                    gradient: AppGradients.hero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          parcel.trackingNumber,
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          parcel.status.name.toUpperCase(),
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white.withValues(alpha: 0.86),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        LinearProgressIndicator(
                          value: parcel.status == ParcelStatus.delivered
                              ? 1
                              : parcel.status == ParcelStatus.inTransit
                              ? 0.72
                              : 0.42,
                          minHeight: 9,
                          backgroundColor: Colors.white.withValues(alpha: 0.18),
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Estimated delivery ${parcel.eta}',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white.withValues(alpha: 0.88),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: MetricTile(
                          title: 'Parcel value',
                          value: '৳${parcel.price.toStringAsFixed(0)}',
                          icon: Icons.payments_outlined,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: MetricTile(
                          title: 'Route',
                          value: '${parcel.origin} to ${parcel.destination}',
                          icon: Icons.route_outlined,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  AppCard(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28.r,
                          backgroundImage: CachedNetworkImageProvider(
                            parcel.riderAvatar,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                parcel.riderName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                parcel.riderPhone,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.call_rounded, color: AppColors.primary),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const SectionHeader(
                    title: 'Delivery history',
                    subtitle: 'Timeline of parcel movement',
                  ),
                  SizedBox(height: 12.h),
                  TimelineView(items: parcel.timeline),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CreateParcelScreen extends StatelessWidget {
  const CreateParcelScreen({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateParcelController>();
    final canPop = Navigator.canPop(context);
    final steps = <Widget>[
      _CreateStepCard(
        title: 'Sender information',
        subtitle: 'Who is sending the parcel?',
        child: Column(
          children: [
            AppTextField(
              controller: controller.senderNameController,
              hintText: 'Sender name',
              prefixIcon: Icons.person_outline,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.senderPhoneController,
              hintText: 'Sender phone',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.senderAddressController,
              hintText: 'Pickup address',
              prefixIcon: Icons.home_outlined,
              maxLines: 3,
            ),
          ],
        ),
      ),
      _CreateStepCard(
        title: 'Receiver information',
        subtitle: 'Who is receiving the parcel?',
        child: Column(
          children: [
            AppTextField(
              controller: controller.receiverNameController,
              hintText: 'Receiver name',
              prefixIcon: Icons.person_outline,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.receiverPhoneController,
              hintText: 'Receiver phone',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.receiverAddressController,
              hintText: 'Delivery address',
              prefixIcon: Icons.location_on_outlined,
              maxLines: 3,
            ),
          ],
        ),
      ),
      _CreateStepCard(
        title: 'Parcel details',
        subtitle: 'Weight, note and handling',
        child: Column(
          children: [
            AppTextField(
              controller: controller.parcelWeightController,
              hintText: 'Weight in kg',
              prefixIcon: Icons.scale_outlined,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 14.h),
            AppTextField(
              controller: controller.parcelNoteController,
              hintText: 'Parcel note',
              prefixIcon: Icons.note_alt_outlined,
              maxLines: 4,
            ),
          ],
        ),
      ),
      _CreateStepCard(
        title: 'Delivery option',
        subtitle: 'Choose speed and handling',
        child: Obx(
          () => Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: ['Express', 'Standard', 'Scheduled']
                .map(
                  (option) => _ChoicePill(
                    label: option,
                    selected: controller.deliveryOption.value == option,
                    onTap: () => controller.deliveryOption.value = option,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      _CreateStepCard(
        title: 'Payment',
        subtitle: 'Select a payment method',
        child: Obx(
          () => Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: ['Cash on delivery', 'Wallet', 'Card']
                .map(
                  (option) => _ChoicePill(
                    label: option,
                    selected: controller.paymentMethod.value == option,
                    onTap: () => controller.paymentMethod.value = option,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      _CreateStepCard(
        title: 'Confirmation',
        subtitle: 'Review and finalize the parcel',
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCard(
                gradient: AppGradients.hero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracking number',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white.withValues(alpha: 0.84),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      controller.trackingNumber.value.isEmpty
                          ? 'Generated after submission'
                          : controller.trackingNumber.value,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text('Delivery option: ${controller.deliveryOption.value}'),
              Text('Payment: ${controller.paymentMethod.value}'),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: canPop
          ? AppBar(
              title: const Text('Create Parcel'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            compact || canPop ? 0 : 18.w,
            14.h,
            compact || canPop ? 0 : 18.w,
            24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!compact && !canPop) ...[
                const BrandHeader(
                  title: 'Create parcel',
                  subtitle: '6-step delivery flow',
                ),
                SizedBox(height: 16.h),
              ],
              AppCard(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Step ${controller.stepIndex.value + 1} of 6',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${((controller.stepIndex.value + 1) / 6 * 100).toStringAsFixed(0)}% Done',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: LinearProgressIndicator(
                          value: (controller.stepIndex.value + 1) / 6,
                          minHeight: 6.h,
                          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: steps[controller.stepIndex.value],
              ),
              SizedBox(height: 18.h),
              Obx(
                () => Row(
                  children: [
                    if (controller.stepIndex.value > 0) ...[
                      Expanded(
                        child: SecondaryButton(
                          text: 'Back',
                          onPressed: controller.previous,
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                    Expanded(
                      child: controller.stepIndex.value == 5
                          ? PremiumButton(
                              text: controller.submitting.value
                                  ? 'Submitting...'
                                  : 'Finish parcel',
                              loading: controller.submitting.value,
                              onPressed: controller.submit,
                            )
                          : PremiumButton(
                              text: 'Next step',
                              onPressed: controller.next,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 24.h),
        children: [
          const BrandHeader(
            title: 'Notifications',
            subtitle: 'System updates and parcel alerts',
          ),
          SizedBox(height: 16.h),
          ...DemoData.notifications.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: NotificationCardView(notification: item),
            ),
          ),
        ],
      ),
    );
  }
}

class ParcelDetailsScreen extends StatelessWidget {
  const ParcelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parcel =
        (Get.arguments as ParcelItem?) ?? DemoData.recentParcels.first;
    return _InfoPage(
      title: 'Parcel details',
      subtitle: 'Detailed status, rider and history view',
      children: [
        ParcelCardView(parcel: parcel),
        SizedBox(height: 14.h),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parcel information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),
              _detailLine(context, 'Tracking number', parcel.trackingNumber),
              _detailLine(context, 'From', parcel.origin),
              _detailLine(context, 'To', parcel.destination),
              _detailLine(
                context,
                'Price',
                '৳${parcel.price.toStringAsFixed(0)}',
              ),
              _detailLine(context, 'ETA', parcel.eta),
            ],
          ),
        ),
        SizedBox(height: 14.h),
        AppCard(
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: CachedNetworkImageProvider(parcel.riderAvatar),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      parcel.riderName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      parcel.riderPhone,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.h),
        const SectionHeader(
          title: 'Delivery history',
          subtitle: 'All movement checkpoints',
        ),
        TimelineView(items: parcel.timeline),
      ],
    );
  }

  Widget _detailLine(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class MyParcelsScreen extends StatelessWidget {
  const MyParcelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      title: 'My parcels',
      subtitle: 'Recent and archived parcel history',
      children: DemoData.recentParcels
          .map(
            (parcel) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ParcelCardView(
                parcel: parcel,
                onTap: () =>
                    Get.toNamed(AppRoutes.parcelDetails, arguments: parcel),
              ),
            ),
          )
          .toList(),
    );
  }
}

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      title: 'Pricing',
      subtitle: 'Transparent delivery pricing for all users',
      children: DemoData.pricing
          .map(
            (tier) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: AppCard(
                gradient: tier.highlighted
                    ? const LinearGradient(
                        colors: [Color(0xFFF7FFE4), Color(0xFFFFFFFF)],
                      )
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            tier.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        if (tier.highlighted)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              'Popular',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      tier.price,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                    Text(
                      tier.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10.h),
                    ...tier.features.map(
                      (feature) => Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(child: Text(feature)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class MerchantRegistrationScreen extends StatelessWidget {
  const MerchantRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final businessController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    return _InfoPage(
      title: 'Merchant registration',
      subtitle: 'Built for high-volume business dispatch',
      children: [
        AppCard(
          gradient: const LinearGradient(
            colors: [Color(0xFFF8FFEE), Color(0xFFFFFFFF)],
          ),
          child: const Text(
            'Bulk pricing, account management, reporting, and priority support.',
          ),
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: nameController,
          hintText: 'Your name',
          prefixIcon: Icons.person_outline,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: businessController,
          hintText: 'Business name',
          prefixIcon: Icons.storefront_outlined,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: phoneController,
          hintText: 'Business phone',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: emailController,
          hintText: 'Business email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        PremiumButton(
          text: 'Submit registration',
          onPressed: () =>
              Get.snackbar('Submitted', 'Merchant registration request sent.'),
        ),
      ],
    );
  }
}

class BecomeRiderScreen extends StatelessWidget {
  const BecomeRiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final cityController = TextEditingController();

    return _InfoPage(
      title: 'Become a rider',
      subtitle: 'Join the logistics network and start earning',
      children: [
        AppCard(
          gradient: const LinearGradient(
            colors: [Color(0xFFF1FAFF), Color(0xFFFFFFFF)],
          ),
          child: const Text(
            'Flexible schedules, transparent earnings, and rider-friendly support.',
          ),
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: nameController,
          hintText: 'Full name',
          prefixIcon: Icons.person_outline,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: phoneController,
          hintText: 'Phone number',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: cityController,
          hintText: 'Current city',
          prefixIcon: Icons.location_city_outlined,
        ),
        SizedBox(height: 16.h),
        PremiumButton(
          text: 'Apply now',
          onPressed: () =>
              Get.snackbar('Application sent', 'We will contact you shortly.'),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final appController = Get.find<AppController>();
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 24.h),
        children: [
          AppCard(
            gradient: AppGradients.hero,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 34.r,
                  backgroundImage: CachedNetworkImageProvider(
                    profileController.profile.value.avatarUrl,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileController.profile.value.name,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        profileController.profile.value.role,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white.withValues(alpha: 0.84),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        profileController.profile.value.email,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white.withValues(alpha: 0.84),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.editProfile),
                  icon: const Icon(Icons.edit_rounded, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: MetricTile(
                  title: 'Saved parcels',
                  value: '${profileController.profile.value.savedParcels}',
                  icon: Icons.bookmark_rounded,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: MetricTile(
                  title: 'Completed',
                  value: '${profileController.profile.value.completedTrips}',
                  icon: Icons.task_alt_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          const SectionHeader(
            title: 'Profile menu',
            subtitle: 'Manage your account and settings',
          ),
          SizedBox(height: 10.h),
          ...DemoData.profileMenus.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: InfoListTile(
                title: item.title,
                subtitle: item.subtitle,
                icon: item.icon,
                onTap: () {
                  switch (item.title) {
                    case 'Personal Information':
                      Get.toNamed(AppRoutes.editProfile);
                      return;
                    case 'Help Center':
                      Get.toNamed(AppRoutes.helpSupport);
                      return;
                    case 'Payment Methods':
                      Get.toNamed(AppRoutes.settings);
                      return;
                    default:
                      Get.snackbar(
                        'ZapShift',
                        'This section is ready for the next API integration step.',
                      );
                      return;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 10.h),
          AppCard(
            child: Column(
              children: [
                SecondaryButton(
                  text: 'Settings',
                  onPressed: () => Get.toNamed(AppRoutes.settings),
                ),
                SizedBox(height: 10.h),
                PremiumButton(text: 'Logout', onPressed: appController.logout),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DemoData.user;
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final phoneController = TextEditingController(text: user.phone);
    final addressController = TextEditingController(text: user.address);

    return _InfoPage(
      title: 'Edit profile',
      subtitle: 'Update your personal and contact details',
      children: [
        AppTextField(
          controller: nameController,
          hintText: 'Full name',
          prefixIcon: Icons.person_outline,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: emailController,
          hintText: 'Email address',
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: phoneController,
          hintText: 'Phone number',
          prefixIcon: Icons.phone_outlined,
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: addressController,
          hintText: 'Address',
          prefixIcon: Icons.location_on_outlined,
          maxLines: 2,
        ),
        SizedBox(height: 16.h),
        PremiumButton(
          text: 'Save changes',
          onPressed: () => Get.snackbar('Updated', 'Profile changes saved.'),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    final profileController = Get.find<ProfileController>();
    return _InfoPage(
      title: 'Settings',
      subtitle: 'Control preferences and app behavior',
      children: [
        AppCard(
          child: Obx(
            () => SwitchListTile(
              value: appController.themeMode.value == ThemeMode.dark,
              onChanged: (_) => appController.toggleTheme(),
              title: const Text('Dark mode'),
              subtitle: const Text('Switch app appearance'),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        AppCard(
          child: Obx(
            () => SwitchListTile(
              value: profileController.notificationsEnabled.value,
              onChanged: (value) =>
                  profileController.notificationsEnabled.value = value,
              title: const Text('Push notifications'),
              subtitle: const Text('Parcel and delivery updates'),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        AppCard(
          child: Obx(
            () => SwitchListTile(
              value: profileController.biometricEnabled.value,
              onChanged: (value) =>
                  profileController.biometricEnabled.value = value,
              title: const Text('Biometric authentication'),
              subtitle: const Text('Use face or fingerprint unlock'),
            ),
          ),
        ),
      ],
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      title: 'Help & support',
      subtitle: 'Need help? reach the team instantly',
      children: [
        ...DemoData.supportActions.map(
          (action) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: InfoListTile(
              title: action.title,
              subtitle: action.subtitle,
              icon: action.icon,
            ),
          ),
        ),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently asked',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),
              const Text(
                'How long does delivery take?\nMost local parcels arrive within hours.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      title: 'About ZapShift',
      subtitle: 'A modern courier platform built for clarity and trust',
      children: [
        AppCard(
          gradient: const LinearGradient(
            colors: [Color(0xFF0A4B50), Color(0xFF163A3F)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our mission',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'We make delivery feel premium, dependable, and easy to manage for customers, riders, and merchants.',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white.withValues(alpha: 0.86),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        const _InfoBullet(
          title: 'Modern UX',
          subtitle: 'Built around fast actions and clear information.',
        ),
        const _InfoBullet(
          title: 'Scalable backend ready',
          subtitle: 'Prepared for real REST API integration and future growth.',
        ),
        const _InfoBullet(
          title: 'Cross-platform support',
          subtitle:
              'Android and iOS ready with dark mode and responsive design.',
        ),
      ],
    );
  }
}

class _InfoPage extends StatelessWidget {
  const _InfoPage({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 24.h),
        children: [
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }
}

class _InfoBullet extends StatelessWidget {
  const _InfoBullet({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: AppCard(
        child: Row(
          children: [
            const Icon(
              Icons.circle_rounded,
              size: 12,
              color: AppColors.primary,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 4.h),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateStepCard extends StatelessWidget {
  const _CreateStepCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 6.h),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 16.h),
            child,
          ],
        ),
      ),
    );
  }
}

class _ChoicePill extends StatelessWidget {
  const _ChoicePill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.primary.withValues(alpha: 0.12),
      labelStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700,
        color: selected
            ? AppColors.primary
            : Theme.of(context).textTheme.bodyMedium?.color,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
    );
  }
}
