import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _getRequest();
              }, 
              child: const Text('Http (Get)', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                _postRequest();
              }, 
              child: const Text('Http (Post)', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }

  // get방식의 통신
  void _getRequest() async {
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/666905865a4d8c00084c1930");

    // http get방식으로 요청한다.
    http.Response response = await http.get(
      url,
      headers: {"Accept" : "application/json"}
    );

    /* 응답 코드 및 데이터 */
    var statusCode = response.statusCode;
    // var responseHeaders = response.headers;
    var resonseBody = utf8.decode(response.bodyBytes);

    print("statusCode: $statusCode");
    // print("responseHeaders: $responseHeaders");
    print("responseBody: $resonseBody");
  }

  // Post방식의 요청
  void _postRequest() async {
    var url = Uri.parse('https://sample.bmaster.kro.kr/contacts');
    
    // 헤더 및 요청시 전송할 데이터를 JSON형식으로 기술
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type' : 'application/x-www-form-urlencoded',
      },
      body: {
        "name" : "해피",
        "tel" : "010-1111-2222",
        "address" : "서울시 종로구"
      },
    );

    var statusCode = response.statusCode;
    // var responseHeaders = response.headers;
    var resonseBody = utf8.decode(response.bodyBytes); // for 한글

    print("StatusCode : $statusCode");
    // print("responseHeaders: $responseHeaders");
    print("responseBody : $resonseBody");
  }
}
