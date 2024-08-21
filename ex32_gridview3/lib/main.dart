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

  late List<Person> persons;

  @override
  void initState() {
    super.initState();

    persons = [];
    for(int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        /* 화면 전체를 감싸는 컨테이너는 아래와 같이 사이즈를 지정하지 않는 것이 좋다.
        가로는 부모의 크기를 지정한고 세로는 전체화면으로 표시된다. */
        // width: double.infinity,
        // height: 400.0,    // 컨테이너로 감싸서 크기를 지정하면 스크롤 가능
        // 그리드뷰 위젯선언
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          // 수평 수직 방향의 아이템간의 간격
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,    // 자동으로 크기가 계산된다.
          childAspectRatio: 0.7,  // 가로, 세로 비율
          children: getGridPage(),
        ),
      ),
    );
  }

  // 그리드뷰의 아이템을 출력할 메서드
  List<Widget> getGridPage() {

    // 리스트 선언
    List<Widget> grid = [];
    for(int i=0; i<persons.length; i++) {
      // 각 항목은 컨테이너로 랩핑
      Widget myWiget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),

        color: Colors.blue[100],
        // 항목에 표시할 타일을 PersonTile 인스턴스로 생성
        child: PersonTile(persons[i], i),
      );
      // 항목을 생성한 후 List에 추가한다.
      grid.add(myWiget);
    }
    // 그리드뷰 위젯으로 반환
    return grid;
  }
}

// 데이터로 사용할 클래스 ===========================================
// VO 클래스
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}

class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;

  PersonTile(this._person, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[100],
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          print('$index번 타일 클릭됨.');
        },
        child: SizedBox(
          width: 140,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: Icon(
                        Icons.account_box,
                        size: 30.0,
                      ),
                    ),
                    Text(
                        _person.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "'${_person.age}세'",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _onClick(index), 
                child: const Text('보기', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onClick(int index) {
    print('$index 클릭됨');
  }
}