import 'package:flutter/material.dart';
import 'dart:convert';
// XML을 JSON으로 변환해주는 패키지
import 'package:xml2json/xml2json.dart';

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
                getJsonData();
              }, 
              child: const Text('JSON Parsing', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                getXMLData();
              }, 
              child: const Text('XML Parsing', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }

  // JSON 데이터 파싱
  void getJsonData() {
    String json = '''
{"items": {"item":
            [{"id": "1", "name": "홍길동"},
             {"id": "2", "name": "전우치"},
             {"id": "3", "name": "손오공"}]
          }
}
''';

    // JSON을 최초 파싱
    var data1 = jsonDecode(json);
    print(data1);

    // 객체이므로 Key를 통해 접근한다.
    List data2 = data1['items']['item'];
    print(data2);

    print('================================================');
    // 일반 for문으로 배열의 크기만큼 반복
    for(int i=0; i<data2.length; i++) {
      print(data2[i]['id']);
    }
    print('================================================');
    // 개선된 for문으로 접근
    for(var item in data2) {
      print(item['name']);
    }
  }

  // XML 데이터 파싱
  void getXMLData() {
    String xmlData = '''
<items>
  <item>
    <id>1</id>
    <name>홍길동2</name>
  </item>
  <item>
    <id>2</id>
    <name>전우치2</name>
  </item>
  <item>
    <id>3</id>
    <name>손오공2</name>
  </item>
</items>
''';
    // XML을 JSON으로 변환 후 파싱을 진행한다.
    Xml2Json xml2json = Xml2Json();
    xml2json .parse(xmlData);
    var json = xml2json.toParker();
    print(json);

    // JSON을 변환 후 2차 파싱한다.
    var data1 = jsonDecode(json);
    print(data1);

    List data2 = data1['items']['item'];
    print(data2);

    print('================================================');
    for(int i=0; i<data2.length; i++) {
      print(data2[i]['id']);
    }
    print('================================================');
    for(var item in data2) {
      print(item['name']);
    }
  }
}