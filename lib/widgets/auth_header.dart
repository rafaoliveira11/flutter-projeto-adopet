import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color(0xFF88C9BF),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              'assets/images/patas.png',
              width: 120,
            ),
          ),
          Positioned(
            bottom: -60,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}