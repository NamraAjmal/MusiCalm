import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:music_app/screens/splash_screen.dart';
import 'package:music_app/screens/signin_page.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ipfibcsgwqesmyypjppe.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlwZmliY3Nnd3Flc215eXBqcHBlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUxNjA1MzksImV4cCI6MjA1MDczNjUzOX0.jgtdh9zFha8YbcF601aItJ6cl34XuFR57RRCAoEnR1I',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusiCalm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
