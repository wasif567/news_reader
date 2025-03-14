import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reader/src/presentation/view/home/home_view.dart';

@injectable
class BottomNavViewstate extends ChangeNotifier {
  // Tab Controller
  TabController? _tabController;
  TabController? get tabController => _tabController;
  set tabController(TabController? val) {
    _tabController = val;
    notifyListeners();
  }

  int _selectedScreen = 0;
  int get selectedScreen => _selectedScreen;
  set selectedScreen(int val) {
    _selectedScreen = val;
    notifyListeners();
  }

  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> screens = [
    HomeView(),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
  ];
}
