import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/app/router/router_constant.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:reader/src/presentation/viewstate/news_viewstate.dart';

// import '../../../application/check_app_reg/check_app_reg_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        navigateToHome();
      } catch (_) {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: kSize.height / 5,
              width: kSize.height / 4,
              child: const CircularProgressIndicator(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  navigateToHome() async {
    Navigator.pushReplacementNamed(context, RouterConstant.bottomNavRoute);
    await Provider.of<NewsViewstate>(context, listen: false).getNewsPopular();
  }
}
