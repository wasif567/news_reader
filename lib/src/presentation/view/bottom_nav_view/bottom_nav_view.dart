import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:reader/src/presentation/view/search_view/search_view.dart';
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart';

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
          length: 6,
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
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute(SearchView()));
          },
          icon: Icon(Icons.search, size: kSize.height * 0.032, color: AppColors.white),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(kSize.width, kSize.height * 0.05),
        child: Consumer<BottomNavViewstate>(
          builder: (context, state, child) {
            if (state.tabController != null) {
              return TabBar(
                // padding: EdgeInsets.symmetric(horizontal: kSize.width * 0.02),
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
                tabs: [
                  Tab(child: Text('Tab 1')),
                  Tab(child: Text('Investment')),
                  Tab(child: Text('Your Earning')),
                  Tab(child: Text('Current Balance')),
                  Tab(child: Text('Tab 5')),
                  Tab(child: Text('Tab 6')),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  // Slide transition function
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
