import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/auth_service.dart';
import 'login_page.dart'; // Ensure this path is correct

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();
  final _businessController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nameController.text.trim(),
        _mobileController.text.trim(),
        _businessController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 90),
                Center(
                  child: Column(
                    children: [
                      Image.asset('lib/Assets/Group84.png', height: 120),
                      SizedBox(height: 10),
                      Text(
                        'ARTHIK SATHI',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(_nameController, 'Full Name', Icons.person),
                _buildTextField(_emailController, 'Email', Icons.email, isEmail: true),
                _buildTextField(_passwordController, 'Password', Icons.lock, isPassword: true),
                _buildTextField(_confirmPasswordController, 'Confirm Password', Icons.lock, isPassword: true),
                _buildTextField(_mobileController, 'Mobile Number', Icons.phone),
                _buildTextField(_businessController, 'Business Name', Icons.business),
                SizedBox(height: 20),
                _buildButton('Sign Up', _isLoading ? null : _signup, isLoading: _isLoading),
                SizedBox(height: 10),
                Center(child: Text('Already have an account?')),
                _buildButton('Sign In', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false, bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter $label';
          if (isEmail && !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$').hasMatch(value)) return 'Enter a valid email';
          if (isPassword && value.length < 6) return 'Password must be at least 6 characters';
          return null;
        },
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback? onPressed, {bool isLoading = false}) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}