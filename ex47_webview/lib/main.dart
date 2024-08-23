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
  // 웹뷰 컨트롤러 선언
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    /*
     웹뷰 컨트롤러 인스턴스 생성 : 채널을 통해 웹뷰와 통신할 수 있도록 설정.
        JS에서 호출 시 '채널명.postMessage(인수)' 형태로 사용.
    */
    controller = WebViewController()
    /* 웹뷰에서 JavaScript 사용 허용 */
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    /* 통신을 위한 채널명(개발자가 정의) */
    ..addJavaScriptChannel(
      "JsFlutter",
      onMessageReceived: (JavaScriptMessage message) {
        // 웹에서 postMessage()로 보낸 메세지를 출력
        print(message.message);
        // 받은 메세지를 스낵바로 출력
        ScaffoldMessenger
          .of(context)
          .showSnackBar(
            SnackBar(content: Text(message.message)),
          );
      }
    )
    /* 내부에 있는 HTML 문서를 웹뷰에 로드 */
    ..loadFlutterAsset("assets/html/my.html");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // HTML에 정의된 JavaScript함수를 Flutter에서 직접 호출
            ElevatedButton(
              onPressed: () => callJavaScript(), 
              child: const Text('Flutter에서 자바스크립트 실행')
            ),
            // 사이즈 박스 하위에 웹뷰 추가
            SizedBox(
              height: 500,
              child: WebViewWidget(
                controller: controller
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 웹뷰 컨트롤러를 통해 HTML페이지의 javascript 함수를 호출
  void callJavaScript() {
    controller.runJavaScript('appToJs("안녕하세요")');
  }
}
