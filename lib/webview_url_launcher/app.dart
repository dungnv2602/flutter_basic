import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

String url = "https://youtube.com/";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final webView = FlutterWebviewPlugin();
  TextEditingController controller = TextEditingController(text: url);

  @override
  void initState() {
    super.initState();

    webView.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
    webView.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: controller,
                ),
              ),
              RaisedButton(
                child: Text("Open Webview"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WebviewScaffold(
                            url: url,
                            appBar: AppBar(
                              title: Text("WebView"),
                            ),
                            withJavascript: true,
                            withLocalStorage: true,
                            withZoom: true,
                          )));
                },
              ),
              RaisedButton(
                child: Text("Open URL LAUNCHER"),
                onPressed: () {
                  launchUrl(url);
                },
              ),
            ],
          ),
        ));
  }

  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      print("Can't Launch $url");
    }
  }
}
