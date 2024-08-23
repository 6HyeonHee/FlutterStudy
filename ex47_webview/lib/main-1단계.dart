import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter 기본형'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 웹뷰 사용을 위한 컨트롤러 생성
  WebViewController controller = WebViewController()
  /* 웹뷰에서 JavaScript 사용여부 설정 */
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    /* 웹뷰의 네비게이션을 제어하고 사용자가 특정 URL로 이동하거나
    페이지를 로드하기 전에 추가적인 작업을 수행 */
    NavigationDelegate(
      onProgress: (int progress) { /* Update loading bar. */},
      onPageStarted: (String url) {},
      onPageFinished: (String url) {print("onPageFinished");},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          // 이 URL로 이동은 차단
          return NavigationDecision.prevent;
        }
        // 특정 URL로 이동을 허용
        return NavigationDecision.navigate;
      },
    ),
  )
  /* 플러터 공식 사이트를 웹뷰에 로드한다. */
  ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      /* 웹뷰를 사용할 때는 전체화면을 사용하게 되므로 노치 디자인에
      적합하도록 safeArea위젯을 사요하는 것이 좋다. */
      body: SafeArea(
        child: Expanded(
          child: WebViewWidget(
            controller: controller
          ),
        ),
      ),
    );
  }
}
