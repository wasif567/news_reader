import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:reader/src/presentation/view/search_view/search_view.dart';
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart';
import 'package:reader/src/presentation/viewstate/news_viewstate.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<BottomNavViewstate>(context, listen: false).tabController = TabController(
          length: 5,
          vsync: this,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Consumer<BottomNavViewstate>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: appBar(context, kSize),
          extendBody: true,
          // bottomNavigationBar: BottomNavBar(),
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
    return AppBar(
      backgroundColor: AppColors.black,
      centerTitle: true,
      elevation: 2,
      title: Text(
        "News Updates",
        style: TextStyle(color: AppColors.darkGrey, fontSize: 18, fontWeight: FontWeight.w700),
      ),
      bottom: PreferredSize(
        preferredSize: Size(kSize.width, kSize.height * 0.05),
        child: Consumer<BottomNavViewstate>(
          builder: (context, state, child) {
            if (state.tabController != null) {
              return TabBar(
                controller: state.tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.white.withValues(alpha: 0.3),
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                  color: AppColors.closeLightTheme,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  color: AppColors.closeLightTheme,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                enableFeedback: true,
                indicatorAnimation: TabIndicatorAnimation.elastic,
                onTap: (value) {
                  Provider.of<NewsViewstate>(context, listen: false).getNews(value);
                },
                tabs: state.tabList,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
