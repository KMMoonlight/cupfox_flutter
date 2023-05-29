import 'package:cupfox/common/value/colors.dart';
import 'package:cupfox/common/widgets/app_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CupfoxPlayer extends StatefulWidget {
  final String playerUrl;

  const CupfoxPlayer({super.key, required this.playerUrl});

  @override
  State<CupfoxPlayer> createState() => _CupfoxPlayerState();
}

class _CupfoxPlayerState extends State<CupfoxPlayer> {
  var controller = WebViewController();
  var loading = true;

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
            onPageFinished: (String url) {
              if (mounted) {
                setState(() {
                  loading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {}),
      )
      ..loadRequest(Uri.parse(widget.playerUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: colorsMap['PrimaryColor'],
              ),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
