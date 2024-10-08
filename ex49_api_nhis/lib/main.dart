import 'package:flutter/material.dart';
import 'my_listview01.dart';

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
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => MyListViewPage01()
                  ),
                );
              }, 
              child: const Text(
                '국민건강보험공단 검진기관 찾기',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
https://apis.data.go.kr/openapi/service/rest/HmcSearchService/getRegnHmcList?serviceKey=ZA5oVKirc%2BMVv3epy%2BUkM86kyJV64leEMizL4SOO7YdQJUXYntslOWLVgcGci8h2%2FQi89HaGK24vIRwOxtS%2BbQ%3D%3D
&hmcNm=%EC%84%9C%EC%9A%B8&siDoCd=11&siGunGuCd=590
*/