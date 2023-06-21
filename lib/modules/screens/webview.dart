import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class VisaScreenWebView extends StatefulWidget {
  const VisaScreenWebView({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  State<VisaScreenWebView> createState() => _VisaScreenWebViewState();
}

class _VisaScreenWebViewState extends State<VisaScreenWebView> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              onWebViewCreated: (controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? LinearProgressIndicator(
                    value: _progress,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
