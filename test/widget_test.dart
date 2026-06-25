import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zapshift/app.dart';
import 'package:zapshift/controllers/app_controllers.dart';
import 'package:zapshift/services/app_services.dart';

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    SharedPreferences.setMockInitialValues(<String, Object>{});

    final storageService = await LocalStorageService().init();
    final apiService = ApiService();

    Get.put<LocalStorageService>(storageService, permanent: true);
    Get.put<ApiService>(apiService, permanent: true);
    Get.put<AppController>(
      AppController(storageService: storageService, apiService: apiService),
      permanent: true,
    );
  });

  testWidgets('boots the ZapShift app shell', (WidgetTester tester) async {
    await tester.pumpWidget(const ZapShiftApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    await tester.pump();

    expect(find.text('ZapShift'), findsWidgets);
  });
}
