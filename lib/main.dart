import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const OnlineDoctorApp());
}

class OnlineDoctorApp extends StatelessWidget {
  const OnlineDoctorApp({super.key});

=======
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';
 
void main() {
  runApp(const MediConnectApp());
}
 
class MediConnectApp extends StatelessWidget {
  const MediConnectApp({super.key});
 
>>>>>>> 53f1c756c15a72f04b26b8f5a4ea12932d653af1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediConnect',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      theme: AppTheme.theme,
      home: const SplashScreen(),
=======
 
      // Global theme: one place to control the look of the whole app.
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ), 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
 
      // ─────────────────────────────────────────────
      // THE ROUTE TABLE — the heart of this lab.
      // Each entry maps a route NAME to a screen WIDGET.
      // ─────────────────────────────────────────────
      initialRoute: '/splash',    // the first screen shown when the app starts
     routes: {
      '/splash': (context) => SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
},
>>>>>>> 53f1c756c15a72f04b26b8f5a4ea12932d653af1
    );
  }
}
