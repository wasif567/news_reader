import 'package:flutter/material.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Scaffold(body: SizedBox(height: kSize.height, width: kSize.width));
  }
}
