import 'package:flutter/material.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const SearchTextfield({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        onSubmitted(value);
      },
      cursorColor: AppColors.white,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: Colors.black54),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: kSize.width * 0.01),
        fillColor: Colors.transparent, // Transparent background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: BorderSide(color: Colors.white), // Border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white), // Normal border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white), // Highlight border
        ),
      ),
    );
  }
}
