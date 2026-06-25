import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_config.dart';
import '../core/app_constants.dart';
import '../models/demo_data.dart';
import '../services/app_services.dart';

class AppController extends GetxController {
  AppController({required this.storageService, required this.apiService});

  final LocalStorageService storageService;
  final ApiService apiService;

  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  final RxBool hasSeenOnboarding = false.obs;
  final RxBool isLoggedIn = false.obs;
  final RxInt bottomNavIndex = 0.obs;
  final Rx<UserProfile> userProfile = DemoData.user.obs;

  @override
  void onInit() {
    super.onInit();
    hasSeenOnboarding.value = storageService.getBool('seen_onboarding');
    isLoggedIn.value = storageService.getBool('is_logged_in');
    final storedTheme = storageService.getString('theme_mode');
    themeMode.value = storedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> markOnboardingComplete() async {
    hasSeenOnboarding.value = true;
    await storageService.setBool('seen_onboarding', true);
  }

  Future<void> setLoggedIn(bool value) async {
    isLoggedIn.value = value;
    await storageService.setBool('is_logged_in', value);
  }

  Future<void> toggleTheme() async {
    themeMode.value = themeMode.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await storageService.setString(
      'theme_mode',
      themeMode.value == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  void setBottomNavIndex(int index) {
    bottomNavIndex.value = index;
  }

  Future<void> logout() async {
    await setLoggedIn(false);
    Get.offAllNamed(AppRouteNames.login);
  }
}

class SplashController extends GetxController {
  SplashController(this.appController);

  final AppController appController;

  Future<void> bootstrap() async {
    await Future<void>.delayed(AppConfig.splashDelay);
    if (!appController.hasSeenOnboarding.value) {
      Get.offAllNamed(AppRouteNames.onboarding);
      return;
    }
    if (!appController.isLoggedIn.value) {
      Get.offAllNamed(AppRouteNames.login);
      return;
    }
    Get.offAllNamed(AppRouteNames.shell);
  }
}

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  Future<void> nextPage() async {
    if (currentPage.value < DemoData.onboarding.length - 1) {
      await pageController.nextPage(
        duration: AppDurations.medium,
        curve: Curves.easeOutCubic,
      );
      return;
    }
    await complete();
  }

  Future<void> skip() async => complete();

  Future<void> complete() async {
    await Get.find<AppController>().markOnboardingComplete();
    Get.offAllNamed(AppRouteNames.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class AuthController extends GetxController {
  AuthController({required this.appController, required this.apiService});

  final AppController appController;
  final ApiService apiService;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final RxBool loading = false.obs;
  final RxBool obscurePassword = true.obs;

  Future<void> login() async {
    loading.value = true;
    try {
      await apiService.login(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      await appController.setLoggedIn(true);
      Get.offAllNamed(AppRouteNames.shell);
    } finally {
      loading.value = false;
    }
  }

  Future<void> register() async {
    loading.value = true;
    try {
      await apiService.register(
        name: registerNameController.text.trim(),
        email: registerEmailController.text.trim(),
      );
      await appController.setLoggedIn(true);
      Get.offAllNamed(AppRouteNames.shell);
    } finally {
      loading.value = false;
    }
  }

  Future<void> sendOtp() async {
    loading.value = true;
    try {
      await apiService.forgotPassword(email: forgotEmailController.text.trim());
      Get.toNamed(AppRouteNames.otp);
    } finally {
      loading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    loading.value = true;
    try {
      await apiService.verifyOtp(
        email: forgotEmailController.text.trim(),
        otp: otpController.text.trim(),
      );
      await appController.setLoggedIn(true);
      Get.offAllNamed(AppRouteNames.shell);
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPhoneController.dispose();
    registerPasswordController.dispose();
    forgotEmailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}

class HomeController extends GetxController {
  final RxString trackingQuery = ''.obs;
  final RxList<ServiceItem> quickActions = DemoData.quickActions.obs;
  final RxList<ServiceItem> services = DemoData.services.obs;
  final RxList<ParcelItem> recentParcels = DemoData.recentParcels.obs;
  final RxList<ReviewItem> reviews = DemoData.reviews.obs;
}

class TrackController extends GetxController {
  final TextEditingController searchController = TextEditingController(
    text: DemoData.recentParcels.first.trackingNumber,
  );
  final RxBool searching = false.obs;
  final Rx<ParcelItem?> selectedParcel = DemoData.recentParcels.first.obs;

  Future<void> searchParcel() async {
    searching.value = true;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 900));
      selectedParcel.value = DemoData.recentParcels.firstWhere((parcel) {
        return parcel.trackingNumber.toLowerCase() ==
            searchController.text.trim().toLowerCase();
      }, orElse: () => DemoData.recentParcels.first);
    } finally {
      searching.value = false;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class CreateParcelController extends GetxController {
  final PageController pageController = PageController();
  final RxInt stepIndex = 0.obs;
  final RxBool submitting = false.obs;
  final RxString trackingNumber = ''.obs;

  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderAddressController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController receiverAddressController =
      TextEditingController();
  final TextEditingController parcelWeightController = TextEditingController();
  final TextEditingController parcelNoteController = TextEditingController();

  final RxString deliveryOption = 'Express'.obs;
  final RxString paymentMethod = 'Cash on delivery'.obs;

  void next() {
    if (stepIndex.value < 5) {
      stepIndex.value += 1;
      pageController.animateToPage(
        stepIndex.value,
        duration: AppDurations.medium,
        curve: Curves.easeOutCubic,
      );
    }
  }

  void previous() {
    if (stepIndex.value > 0) {
      stepIndex.value -= 1;
      pageController.animateToPage(
        stepIndex.value,
        duration: AppDurations.medium,
        curve: Curves.easeOutCubic,
      );
    }
  }

  Future<void> submit() async {
    submitting.value = true;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 1100));
      trackingNumber.value =
          'ZX-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      Get.snackbar(
        'Parcel created',
        'Tracking number ${trackingNumber.value} is ready.',
      );
      stepIndex.value = 5;
    } finally {
      submitting.value = false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    senderNameController.dispose();
    senderPhoneController.dispose();
    senderAddressController.dispose();
    receiverNameController.dispose();
    receiverPhoneController.dispose();
    receiverAddressController.dispose();
    parcelWeightController.dispose();
    parcelNoteController.dispose();
    super.onClose();
  }
}

class ProfileController extends GetxController {
  final Rx<UserProfile> profile = DemoData.user.obs;
  final RxBool notificationsEnabled = true.obs;
  final RxBool biometricEnabled = false.obs;
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find<AppController>()),
    );
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<AuthController>(
      () => AuthController(
        appController: Get.find<AppController>(),
        apiService: Get.find<ApiService>(),
      ),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TrackController>(() => TrackController());
    Get.lazyPut<CreateParcelController>(() => CreateParcelController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
