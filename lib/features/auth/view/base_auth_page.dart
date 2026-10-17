import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkFields);
    _emailController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    final filled =
        _nameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _passwordController.text.isNotEmpty;
    if (filled != _isFilled) setState(() => _isFilled = filled);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    // TODO: حط منطق التسجيل هنا (Firebase مثلًا)
  }

  void _goToLogin() {
    // TODO: Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1B1B1B),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Let's create your account.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              _buildLabel('Full Name'),
              _buildField(
                controller: _nameController,
                hint: 'Enter your full name',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 18),

              _buildLabel('Email'),
              _buildField(
                controller: _emailController,
                hint: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),

              _buildLabel('Password'),
              _buildField(
                controller: _passwordController,
                hint: 'Enter your password',
                obscure: _obscure,
                suffix: IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              const SizedBox(height: 20),

              // Create account button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isFilled ? _createAccount : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B1B1B),
                    disabledBackgroundColor: const Color(0xFFD0D0D0),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
              _socialButton(
                text: 'Sign Up with Google',

                icon: Image.asset('assets/Google__G__logo.svg.webp', width: 22),
                background: Colors.white,
                textColor: const Color(0xFF1B1B1B),
                borderColor: const Color(0xFFE0E0E0),
                onTap: () {},
              ),
              const SizedBox(height: 12),

              // Facebook
              _socialButton(
                text: 'Sign Up with Facebook',
                icon: const Icon(Icons.facebook, size: 24, color: Colors.white),
                background: const Color(0xFF1877F2),
                textColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(height: 28),

              // Log in
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: _goToLogin,
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1B1B1B),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1B1B1B),
      ),
    ),
  );

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
    TextInputType? keyboardType,
  }) {
    OutlineInputBorder border(Color c) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: c),
    );

    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: border(const Color(0xFFE8E8E8)),
        focusedBorder: border(const Color(0xFF1B1B1B)),
      ),
    );
  }

  // ignore: unused_element
  TextSpan _link(String text) => TextSpan(
    text: text,
    style: const TextStyle(
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
    ),
  );

  Widget _socialButton({
    required String text,
    required Widget icon,
    required Color background,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
