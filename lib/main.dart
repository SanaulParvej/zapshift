import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'controllers/app_controllers.dart';
import 'services/app_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = await LocalStorageService().init();
  final apiService = ApiService();

  Get.put<LocalStorageService>(storageService, permanent: true);
  Get.put<ApiService>(apiService, permanent: true);
  Get.put<AppController>(
    AppController(storageService: storageService, apiService: apiService),
    permanent: true,
  );

  runApp(const ZapShiftApp());
}
