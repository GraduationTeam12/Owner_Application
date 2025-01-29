//

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:user_app/constants/pages_name.dart';

class OwnerCarSplashScreen extends StatefulWidget {
  const OwnerCarSplashScreen({super.key});

  @override
  State<OwnerCarSplashScreen> createState() => _OwnerCarSplashScreenState();
}

class _OwnerCarSplashScreenState extends State<OwnerCarSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _controller.forward();

      Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, homePageScreen);
     
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xFFD2B48C),
            ],
          ),
        ),
        child: SizedBox(
          // height: MediaQuery.sizeOf(context).height,
          // width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                width: MediaQuery.sizeOf(context).width > 600 ? 400 : null,
                height: MediaQuery.sizeOf(context).width > 600 ? 400 : null,
                'assets/images/auth_images/nnnnnsplash.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
