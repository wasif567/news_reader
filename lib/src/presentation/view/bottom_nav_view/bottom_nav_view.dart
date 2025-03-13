import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Consumer<BottomNavViewstate>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: appBar(context, kSize),
          extendBody: true,
          body: SizedBox(
            height: kSize.height,
            width: kSize.width,
            child: PageStorage(bucket: state.bucket, child: state.screens[state.selectedScreen]),
          ),
        );
      },
    );
  }

  AppBar appBar(BuildContext context, Size kSize) {
    return AppBar();
  }
}
