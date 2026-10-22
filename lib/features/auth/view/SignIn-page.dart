import 'package:e_commerce/core/constant/text_title.dart';
import 'package:e_commerce/features/auth/view/create_account_page.dart';
import 'package:e_commerce/features/auth/view/forget_password_page.dart';
import 'package:flutter/material.dart';

class SginIn extends StatefulWidget {
  const SginIn({super.key});

  @override
  State<SginIn> createState() => _SginInState();
}

class _SginInState extends State<SginIn> {
  static const Color headerColor = Color(0xFF1B1B1B);
  bool isObscure = true; // show / hide password
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login button is enabled only when both fields have text
  bool get isFormFilled =>
      emailController.text.trim().isNotEmpty &&
      passwordController.text.isNotEmpty;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Shared border style for the text fields
  OutlineInputBorder fieldBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void _login() {
    if (!formKey.currentState!.validate()) return;
    // TODO: login logic here (Firebase signInWithEmailAndPassword)
  }

  void _goToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Login to your account",
                  style: TextTitle.titleColor,
                ),
                const SizedBox(height: 10),
                const Text(
                  "It's great to see you again.",
                 style: TextTitle.subtitle,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Email",
                  style: TextTitle.hintText,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  onChanged: (_) => setState(() {}),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    hintStyle:  TextTitle.hintField,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: fieldBorder(const Color(0xFFE0E0E0)),
                    enabledBorder: fieldBorder(const Color(0xFFE0E0E0)),
                    focusedBorder: fieldBorder(headerColor),
                    errorBorder: fieldBorder(Colors.red),
                    focusedErrorBorder: fieldBorder(Colors.red),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Password",
                 style: TextTitle.hintText,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  onChanged: (_) => setState(() {}),
                  validator: _validatePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextTitle.hintField,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => isObscure = !isObscure),
                      icon: Icon(
                        isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                    border: fieldBorder(const Color(0xFFE0E0E0)),
                    enabledBorder: fieldBorder(const Color(0xFFE0E0E0)),
                    focusedBorder: fieldBorder(headerColor),
                    errorBorder: fieldBorder(Colors.red),
                    focusedErrorBorder: fieldBorder(Colors.red),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Forgot your password ?",
                      style: TextStyle(fontSize: 14, color: headerColor),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        "Reset your password",
                        style: TextStyle(
                          fontSize: 14,
                          color: headerColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: headerColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    // null = disabled (grey) until both fields are filled
                    onPressed: isFormFilled ? _login : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: headerColor,
                      disabledBackgroundColor: const Color(0xFFD0D0D0),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Or divider
                const Row(
                  children: [
                    Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Or', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                  ],
                ),
                const SizedBox(height: 20),

                // Google
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Google__G__logo.svg.webp', width: 22),
                      const SizedBox(width: 10),
                      const Text(
                        "Login with Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: headerColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Facebook
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1877F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.white, size: 26),
                      SizedBox(width: 10),
                      Text(
                        "Login with Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Sign up link
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: _goToSignUp,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: headerColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}