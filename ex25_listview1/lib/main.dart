import 'package:flutter/material.dart';

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
      /*
       방법1 : 명시적으로 ListView의 Children으로 List를 넘겨서 생성한다.
            리스트뷰가 로드될 때 데이터까지 한꺼번에 로드되므로 갯수가
            적을 때 적합한 방식이다.
      */
      body: ListView(
        // 1단계
        // children: [
        //   ListTile(
        //     // 좌측아이콘(혹은 이미지)
        //     leading: FlutterLogo(
        //       size: 50.0,
        //     ),
        //     // 타일에 출력할 제목
        //     title: Text('Basic #1'),
        //     // 출력할 내용
        //     subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        //     // 우측 아이콘
        //     trailing: Icon(Icons.more_vert),
        //     // 눌렀을 때 동작
        //     onTap: () {
        //       print('리스트뷰의 타일 Tap');
        //     },
        //   )
        // ],

        // 2단계
        // children: getMyList1(),
        
        // 3단계
        children: getMyList2(),
      ),
    );
  }

  // 2단계 : body내에서 작성했던 부분을 별도의 메서드로 구현
  List<Widget> getMyList1() {
    List<Widget> myList = [
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #1'),
        subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('리스트뷰의 타일 Tap');
        },
      ),
      // 리스트뷰의 타일을 구분하는 선
      Divider (
        color: Colors.grey,
        height: 5,
        // 좌우측의 여백을 지정하는 속성
        indent: 10,
        endIndent: 10,
      ),
    ];
    return myList;
  }

  // 3단계 : 데이터를 이용해서 갯수만큼 반복하는 List를 생성
  List<Widget> getMyList2() {

    // 데이터로 사용할 리스트 생성
    List<Person> persons = [];
    for(int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i', true));
    }

    // 앞에서 준비한 데이터를 이용해서 리스트타일 생성
    List<Widget> myList = [];
    for (int i=0; i<persons.length; i++) {
      /* 데이터 갯수만큼 리스트 타일을 생성하여 List에 추가한다.
      ListTile은 Widget으로 받을 수 있다. */
      Widget wid = ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #$i'),
        subtitle: Text('${persons[i].name} - ${persons[i].age}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #$i');
        },
      );

      // ListTile 인스턴스 생성 후 List에 추가한다.
      myList.add(wid);
    }
    return myList;
  }
}

// 데이터를 사용 할 DTO 클래스
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}
