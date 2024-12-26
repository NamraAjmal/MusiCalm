import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.jpg',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, size: 100, color: Colors.red),
                ),
                SizedBox(height: 10),
                Text(
                  'MusiCalm',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 5),
                Text(
                  'Music for every Mood',
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[400]),
                ),
                SizedBox(height: 20),
                _buildTextField(emailController, 'Enter Email', false),
                SizedBox(height: 20),
                _buildTextField(passwordController, 'Enter Password', true),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final response = await Supabase.instance.client.auth
                          .signInWithPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (response.user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign in successful!')),
                        );
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        throw 'Sign in failed';
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  child: Text('Sign In'),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, bool isPassword) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}