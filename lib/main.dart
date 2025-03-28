import 'package:ecommerce_app_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:ecommerce_app_dashboard/core/utils/app_color.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(
          scaffoldBackgroundColor: Colors.white,
    //textTheme: GoogleFonts.abhayaLibreTextTheme(),
          fontFamily: 'Cairo',
          colorScheme: ColorScheme.fromSeed(
              seedColor:AppColors.primaryColor
          )
      ),
     debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,

    );
  }
}

