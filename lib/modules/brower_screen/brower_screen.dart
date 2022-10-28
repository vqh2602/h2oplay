import 'dart:async';
import 'dart:io';

import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'brower_controller.dart';

class BrowserScreen extends StatefulWidget {
  static const String routeName = '/BrowserScreen';
  const BrowserScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBrowserScreen();
  }
}

class _MyBrowserScreen extends State<BrowserScreen> {
  bool doneFocus = false;
  BrowserController browserController = Get.find();

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://www.pixelstalk.net/wp-content/uploads/2016/06/Free-HD-Starry-Night-Wallpapers-Download-768x432.jpg',),
                  fit: BoxFit.fill
              )
          ),
          // color: const Color(0XFF050133),
          child: Center(
              child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search)
                      ),
                      controller: urlController,
                      keyboardType: TextInputType.url,
                      style: const TextStyle(color: Colors.white),
                      onSubmitted: (value) {
                        var url = Uri.parse(value);
                        if (url.scheme.isEmpty) {
                          url = Uri.parse(
                              "https://www.google.com/search?q=$value");
                        }
                        webViewController?.loadUrl(
                            urlRequest: URLRequest(url: url));
                      },
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          InAppWebView(
                            key: webViewKey,
                            initialUrlRequest:
                            URLRequest(url: Uri.parse(
                                "https://www.google.com/"),
                            ),
                            initialOptions: options,
                            pullToRefreshController: pullToRefreshController,
                            onWebViewCreated: (controller) {
                              webViewController = controller;
                            },
                            onLoadStart: (controller, url) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            androidOnPermissionRequest: (controller, origin,
                                resources) async {
                              return PermissionRequestResponse(
                                  resources: resources,
                                  action: PermissionRequestResponseAction
                                      .GRANT);
                            },
                            shouldOverrideUrlLoading: (controller,
                                navigationAction) async {
                              var uri = navigationAction.request.url!;
                              return null;
                            },
                            onLoadStop: (controller, url) async {
                              pullToRefreshController.endRefreshing();
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onLoadError: (controller, url, code, message) {
                              pullToRefreshController.endRefreshing();
                            },
                            onProgressChanged: (controller, progress) {
                              if (progress == 100) {
                                pullToRefreshController.endRefreshing();
                              }
                              setState(() {
                                this.progress = progress / 100;
                                urlController.text = url;
                              });
                            },
                            onUpdateVisitedHistory: (controller, url,
                                androidIsReload) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onConsoleMessage: (controller, consoleMessage) {
                              print(consoleMessage);
                            },
                          ),
                          progress < 1.0
                              ? LinearProgressIndicator(value: progress)
                              : Container(),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DpadContainer(
                            onClick: () {
                              webViewController?.goBack();
                              },
                            child: ElevatedButton(
                              child: const Icon(Icons.arrow_back),
                              onPressed: () {
                                webViewController?.goBack();
                              },
                            ),
                            onFocus: (f){}),
                        DpadContainer(
                            onClick: () {
                              webViewController?.goForward();
                            },
                            child: ElevatedButton(
                              child: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                webViewController?.goForward();
                              },
                            ),
                            onFocus: (f){}),
                       DpadContainer(
                           onClick: () {
                             webViewController?.scrollBy(x: 150, y: 150);
                           },
                           child:  ElevatedButton(
                             child: const Icon(Icons.arrow_downward),
                             onPressed: () {
                               webViewController?.scrollBy(x: 150, y: 150);
                             },
                           ),
                           onFocus: (f){}),
                        DpadContainer(
                            onClick: () {
                              webViewController?.scrollBy(x: -150, y: -150);
                            },
                            child: ElevatedButton(
                              child: const Icon(Icons.arrow_upward),
                              onPressed: () {
                                webViewController?.scrollBy(x: -150, y: -150);
                              },
                            ),
                            onFocus: (f){}),
                        DpadContainer(
                            onClick: () {
                              webViewController?.reload();
                            },
                            child: ElevatedButton(
                              child: const Icon(Icons.refresh),
                              onPressed: () {
                                webViewController?.reload();
                              },
                            ),
                            onFocus: (f){})
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }
}
