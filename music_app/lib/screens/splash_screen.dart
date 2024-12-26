import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(Duration(seconds: 3));

    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/signIn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'MusiCalm',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Music for every Mood',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
