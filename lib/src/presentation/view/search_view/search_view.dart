import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:reader/src/presentation/core/widget/search_textfield.dart';
import 'package:reader/src/presentation/viewstate/news_viewstate.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBar(context, kSize),
      backgroundColor: AppColors.black,
      body: Consumer<NewsViewstate>(
        builder: (context, state, child) {
          return SizedBox(
            height: kSize.height,
            width: kSize.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: kSize.height * 0.1),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: kSize.width * 0.07),
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Search",
                      style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appBar(BuildContext context, Size kSize) {
    return AppBar(
      backgroundColor: AppColors.black,

      leading: IconButton(
        style: IconButton.styleFrom(shape: CircleBorder(side: BorderSide(color: AppColors.white))),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: AppColors.white, size: kSize.height * 0.032),
      ),
      titleSpacing: 0,
      actionsPadding: EdgeInsets.zero,
      title: Consumer<NewsViewstate>(
        builder: (context, state, child) {
          return Padding(
            padding: EdgeInsets.only(left: kSize.width * 0.016, right: kSize.width * 0.04),
            child: SearchTextfield(
              controller: state.searchController,
              onSubmitted: (query) {
                //
              },
            ),
          );
        },
      ),
    );
  }
}
