import 'package:flutter/material.dart';
import 'package:footclient/Controller/home_controller.dart';
import 'package:footclient/Controller/login_controller.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "",
      appId: "",
      messagingSenderId: "",
      projectId: "",
    ),
  );

  Get.put(LoginController());
  Get.put(HomeController());


  runApp(
    GetMaterialApp(
      home: LoginPage(),
      title: 'Footware Client App',
      debugShowCheckedModeBanner: false,
    ),
  );
}
