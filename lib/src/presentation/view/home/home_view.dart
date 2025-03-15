import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader/src/domain/core/models/article_model/article_model.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:reader/src/presentation/core/widget/article_card.dart';
import 'package:reader/src/presentation/view/news_detail_view/news_detail_view.dart';
import 'package:reader/src/presentation/viewstate/bottom_nav_viewstate.dart';
import 'package:reader/src/presentation/viewstate/news_viewstate.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Consumer<NewsViewstate>(
      builder: (context, state, child) {
        return SizedBox(
          height: kSize.height,
          width: kSize.width,
          child:
              state.isLoading
                  ? Center(child: CircularProgressIndicator(color: Colors.red))
                  : state.newsResponse != null
                  ? ListView.separated(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 32),
                    itemBuilder: (context, index) {
                      Article article = state.newsResponse!.articles[index];
                      return GestureDetector(
                        onTap: () {
                          BottomNavViewstate viewstate = Provider.of<BottomNavViewstate>(
                            context,
                            listen: false,
                          );
                          Navigator.push(
                            context,
                            _createRoute(
                              NewsDetailView(
                                title: viewstate.tabList[viewstate.tabController!.index].text!,
                                article: article,
                              ),
                            ),
                          );
                        },
                        child: ArticleCard(article: article),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: state.newsResponse!.articles.length,
                  )
                  : Center(child: Text("No Data")),
        );
      },
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
