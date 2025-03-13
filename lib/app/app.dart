import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:reader/app/injector/injector.dart';
import 'package:reader/app/router/router.dart';
import 'package:reader/app/router/router_constant.dart';
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart';
import 'package:reader/src/presentation/viewstate/news_viewstate.dart';

// import '../src/application/dashboard/task_managment/task_bloc.dart';
// import '../src/application/user/user_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<NewsViewstate>()),
        ChangeNotifierProvider(create: (_) => getIt<BottomNavViewstate>()),
      ],
      child: MaterialApp(
        title: "News Reader",
        initialRoute: RouterConstant.splashRoute,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
