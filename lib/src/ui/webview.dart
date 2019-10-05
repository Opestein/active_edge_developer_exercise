//import 'package:firebase_analytics/observer.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:workwise/src/provider/server_provider/base_url.dart';
//
//const kAndroidUserAgent =
//    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
//
//class WebViewScreen extends StatefulWidget {
//  final String url;
//  FirebaseAnalyticsObserver observer;
//
//  WebViewScreen({
//    this.url,
//    this.observer,
//    Key key,
//  }) : super(key: key);
//
//  static const String routeName = '/webViewScreen';
//
//  @override
//  State<StatefulWidget> createState() => WebViewScreenState(url: url);
//}
//
//class WebViewScreenState extends State<WebViewScreen> {
////  WebViewController _controller;
//  InAppWebViewController webView;
//  String url;
//
//  WebViewScreenState({this.url});
//
//  @override
//  void initState() {
//    super.initState();
//    _sendCurrentTabToAnalytics();
//  }
//
//  void _sendCurrentTabToAnalytics() {
//    widget.observer.analytics.setCurrentScreen(
//      screenName: '${WebViewScreen.routeName}',
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: WebviewScaffold(
//        url: baseUrl + "blog/?page_id=5634",
////      appBar: new AppBar(
////        title: const Text('Widget webview'),
////      ),
////      withZoom: true,
//        withLocalStorage: true,
//        withJavascript: true,
//        enableAppScheme: true,
//
//        hidden: false,
//        userAgent: kAndroidUserAgent,
//        initialChild: Container(
//          child: Center(
//            child: CircularProgressIndicator(
//              backgroundColor: Color(0xFF269A4C),
//            ),
//          ),
//        ),
//      ),
//    );
////    return Scaffold(
////      body: InAppWebView(
////        initialUrl: etransactDepositCompleteUrl + widget.url,
////        initialHeaders: {},
////        initialOptions: {},
////        onWebViewCreated: (InAppWebViewController controller) {
////          webView = controller;
//////                      webView.loadUrl(url)
////        },
////        onLoadStart: (InAppWebViewController controller, String url) {
////          print("started $url");
////          setState(() {
//////                        this.url = url;
////          });
////        },
////        onProgressChanged: (InAppWebViewController controller, int progress) {
////          setState(() {
//////                        this.progress = progress/100;
////          });
////        },
////      ),
////    );
////    return Scaffold(
////
////
////        body: Container(
////          child: Column(
////            children: <Widget>[
////              Container(
////                padding: EdgeInsets.all(20.0),
////                child: Text("CURRENT URL\n${ (url.length > 50) ? url.substring(0, 50) + "..." : url }"),
////              ),
////              (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
////              Expanded(
////                child: Container(
////                  margin: const EdgeInsets.all(10.0),
////                  decoration: BoxDecoration(
////                      border: Border.all(color: Colors.blueAccent)),
////                  child: InAppWebView(
////                    initialUrl:
////                        "https://demo.etranzact.com/webconnect/v3/caller.jsp?" +
////                            widget.url,
////                    initialHeaders: {},
////                    initialOptions: {},
////                    onWebViewCreated: (InAppWebViewController controller) {
////                      webView = controller;
//////                      webView.loadUrl(url)
////                    },
////                    onLoadStart:
////                        (InAppWebViewController controller, String url) {
////                      print("started $url");
////                      setState(() {
//////                        this.url = url;
////                      });
////                    },
////                    onProgressChanged:
////                        (InAppWebViewController controller, int progress) {
////                      setState(() {
//////                        this.progress = progress/100;
////                      });
////                    },
////                  ),
////                ),
////              ),
////              ButtonBar(
////                alignment: MainAxisAlignment.center,
////                children: <Widget>[
////                  RaisedButton(
////                    child: Icon(Icons.arrow_back),
////                    onPressed: () {
////                      if (webView != null) {
////                        webView.goBack();
////                      }
////                    },
////                  ),
////                  RaisedButton(
////                    child: Icon(Icons.arrow_forward),
////                    onPressed: () {
////                      if (webView != null) {
////                        webView.goForward();
////                      }
////                    },
////                  ),
////                  RaisedButton(
////                    child: Icon(Icons.refresh),
////                    onPressed: () {
////                      if (webView != null) {
////                        webView.reload();
////                      }
////                    },
////                  ),
////                ],
////              ),
////            ].where((Object o) => o != null).toList(),
////          ),
////        ),
////        bottomNavigationBar: BottomNavigationBar(
////          currentIndex: 0,
////          items: [
////            BottomNavigationBarItem(
////              icon: Icon(Icons.home),
////              title: Text('Home'),
////            ),
////            BottomNavigationBarItem(
////              icon: Icon(Icons.mail),
////              title: Text('Item 2'),
////            ),
////            BottomNavigationBarItem(
////                icon: Icon(Icons.person), title: Text('Item 3'))
////          ],
////        ),
////
////    );
//  }
////    _loadHtmlFromAssets();
////    return Scaffold(
////      appBar: AppBar(title: Text('WebView')),
////      body: WebView(
////        initialUrl: '',
////        javascriptMode: JavascriptMode.unrestricted,
////        onWebViewCreated: (WebViewController webViewController) {
////          _controller = webViewController;
////        },
////      ),
////    );
//}
//
////  _loadHtmlFromAssets() async {
//////    String fileText = await rootBundle.loadString('assets/help.html');
////    print('https://demo.etranzact.com' +
////        '/webconnect/v3/caller.jsp' +
////        widget.url.toString());
////    _controller.loadUrl(
////        Uri.https('demo.etranzact.com', "/webconnect/v3/caller.jsp", widget.url
//////        {"ref":"ET-DAAWJKPFAEFOJ","responseUrl":"https://blooming-atoll-19242.herokuapp.com/deposit","logoUrl":"http://naijaweb.herokuapp.com/img/brand/logo.png","amount":"100.00","currencyCode":"NGN","email":"ff","terminalId":"0000000001","phoneNumber":"22","fullName":"ff ff","checksum":"d6dedacada274ce3e27e012cb275de8b"}
//////            mimeType: 'text/html',
//////        encoding: Encoding.getByName('utf-8')
////                )
////            .toString());
////  }
////}
