import 'dart:async';
import 'package:e_commerce/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const String _backgroundImage = 'assets/Element.png'; 
  static const String _logoImage = 'assets/Vector.png'; 

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), _goToNextPage);
  }

  void _goToNextPage() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => OnboardingPage()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          if (_backgroundImage.isNotEmpty)
            Image.asset(_backgroundImage, fit: BoxFit.cover),

    
          Center(
            child: _logoImage.isNotEmpty
                ? Image.asset(_logoImage, width: 150)
                : const SizedBox(width: 150, height: 150),
          ),

          // 3) اللودينج تحت
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

