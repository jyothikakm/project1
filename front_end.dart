main.dart;

import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIVE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Set the initial route to the login page
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
file_upload_page.dart

import 'package:flutter/material.dart';

class FileUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add file upload functionality
            // For demonstration purposes, navigate back to the login page
            Navigator.pop(context);
          },
          child: Text('Upload File'),
        ),
      ),
    );
  }
}
login_page.dart

import 'package:flutter/material.dart';
import 'file_upload_page.dart'; // Import the file upload page
import 'signup_page.dart'; // Import the sign-up page
import 'package:flutter/services.dart';
import 'dart:js' as js;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _usernameError; // Variable to store username error message
  String? _passwordError; // Variable to store password error message
  bool _passwordVisible = false; // Variable to toggle password visibility

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Simulate login functionality (replace with actual authentication logic)
    await Future.delayed(Duration(seconds: 1)); // Simulating async operation
    if (username == 'admin' && password == 'password') {
      // Navigate to file upload page upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FileUploadPage()),
      );
    } else {
      setState(() {
        _usernameError =
            'Invalid username or password.'; // Update username error message
        _passwordError =
            'Invalid username or password.'; // Update password error message
      });
    }
  }

  void _navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HIVE',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color for "HIVE"
          ),
        ),
        backgroundColor: Colors.black, // Background color for appbar
        elevation: 0, // Remove shadow
      ),
      body: Center(
        child: Container(
          width: 300, // Adjusted width for better mobile responsiveness
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black), // Border color
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200, // Set height of the container to 200
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://media.licdn.com/dms/image/D5612AQHHEhZzP1aMmg/article-cover_image-shrink_720_1280/0/1709211475536?e=2147483647&v=beta&t=IN73MJ4064Q-T3UDHeStkUet6p2w1uz8QZeHdIbQjXY',
                      ),
                      fit: BoxFit
                          .cover, // Fit the image to cover the entire container
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _usernameError, // Display inline error message
                  ),
                  onChanged: (_) => setState(() =>
                      _usernameError = null), // Clear error when text changes
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _passwordError, // Display inline error message
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                        RegExp('[ ]')), // Mask text
                  ],
                  onChanged: (_) => setState(() =>
                      _passwordError = null), // Clear error when text changes
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: _navigateToSignUpPage,
                  child: Text(
                    'New User? Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
signup_page.dart

import 'package:flutter/material.dart';
import 'file_upload_page.dart'; // Import the file upload page
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError; // Variable to store email error message
  String? _usernameError; // Variable to store username error message
  String? _passwordError; // Variable to store password error message
  bool _passwordVisible = false; // Variable to toggle password visibility

  void _signUp() {
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Validate email
    if (!_isValidEmail(email)) {
      setState(() {
        _emailError = 'Invalid email address';
      });
      return;
    }

    // Additional validation for username and password can be added here

    // Proceed with sign-up process
    // You can implement this part according to your authentication logic
    // For demonstration purposes, let's just print the entered data
    print('Email: $email');
    print('Username: $username');
    print('Password: $password');

    // You can navigate to another page after successful sign-up
  }

  bool _isValidEmail(String email) {
    // Basic email validation
    // You can use a more comprehensive validation method if needed
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color for "Sign Up"
          ),
        ),
        backgroundColor: Colors.black, // Background color for appbar
        elevation: 0, // Remove shadow
      ),
      body: Center(
        child: Container(
          width: 300, // Adjusted width for better mobile responsiveness
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black), // Border color
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _emailError, // Display inline error message
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _usernameError, // Display inline error message
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorText: _passwordError, // Display inline error message
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                        RegExp('[ ]')), // Mask text
                  ],
                  onChanged: (_) => setState(() =>
                      _passwordError = null), // Clear error when text changes
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
index.html

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>HIVE</title>
  <meta name="web-app" content="HIVE">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500">
  <link rel="shortcut icon" type="image/x-icon" href="https://img.freepik.com/free-vector/pink-cloud-security-icon-digital-networking-system_53876-119491.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1708300800&semt=ais">
</head>

<body>
  <script src="main.dart.js" type="application/javascript"></script>
</body>

</html>
pubsec.yaml

name: front_end
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.0-116.0.dev

# Add regular dependencies here.
dependencies:
  # path: ^1.8.0
  file_picker: ^8.0.0+1
  http: ^1.2.0 
  dio: ^5.4.0 
  flutter:
    sdk: flutter
  js: ^0.6.7
  firebase_auth: ^4.17.9
  firebase_core: ^2.27.1


dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
  flutter_test:
    sdk: flutter
flutter:
  uses-material-design: true
  assets:
    
    - web/favicon.png
    - web/manifest.json
    - web/icons/
