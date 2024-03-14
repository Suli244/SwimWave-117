
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSw extends StatefulWidget {
  final String url;
  final String title;

  const WebSw({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebSw> createState() => _WebPlinkState();
}

class _WebPlinkState extends State<WebSw> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SwColors.blue2,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.h,
            color: SwColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const BackButton(color: SwColors.black),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
