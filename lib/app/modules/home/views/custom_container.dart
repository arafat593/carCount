import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final int count;
  final List<Color> gradientColors;
  final Color shadowColor;
  final Function() onTap;
  final Color textColor;

  const CustomContainer({
    super.key,
    required this.title,
    required this.count,
    required this.gradientColors,
    required this.shadowColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.45),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Count = $count",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
