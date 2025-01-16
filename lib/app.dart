import 'package:Saz/bindings/general_bindings.dart';
import 'package:Saz/bottom_navigation.dart';
import 'package:Saz/controllers/theme_controller.dart';
import 'package:Saz/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:Saz/utils/constants/text_strings.dart';
import 'package:Saz/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
  final ThemeController themeController = Get.put(ThemeController()); 

    return Obx(
      ()=> GetMaterialApp(
        title: TTexts.appName,
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark: ThemeMode.light,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
      
        initialBinding: GeneralBindings(),
        // initialBinding: GeneralBindings(),
        home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
      ),
    );
  }
}



class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: ()=> Get.to(()=> const BottomNavigation()) , child: const Text("data")),
    );
  }
}