import 'package:flutter/material.dart';
import 'package:reader/src/domain/core/models/article_model/article_model.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailView extends StatefulWidget {
  final Article article;
  final String title;
  const NewsDetailView({super.key, required this.article, required this.title});

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  late final WebViewController _controller;
  ValueNotifier<int> progress = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progressValue) {
                progress.value = progressValue;
              },
              onPageStarted: (String url) {
                debugPrint('Page loading started: $url');
              },
              onPageFinished: (String url) {
                debugPrint('Page loading finished: $url');
              },
              onWebResourceError: (WebResourceError error) {
                debugPrint('WebView error: ${error.description}');
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.article.url!));
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBar(context, kSize),
      body: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: progress,
            builder: (context, progressValue, child) {
              return progressValue < 100
                  ? LinearProgressIndicator(value: progressValue / 100)
                  : const SizedBox.shrink();
            },
          ),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context, Size kSize) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: kSize.height * 0.032, color: AppColors.white),
      ),
      backgroundColor: AppColors.black,
      centerTitle: true,
      elevation: 2,
      title: Text(
        widget.title,
        style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
