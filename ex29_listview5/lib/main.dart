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
  // 데이터로 사용할 List 생성
  late List<Person> persons;

  // 위젯 초기화 시 State를 초기화하는 수명주기 메서드
  @override
  void initState() {
    super.initState();
    persons = [];
    for (int i=0; i<15; i++) {
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
        margin:  EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        // width: 250,
        // height: 250,

        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[700],
              child: Text('Entry A', style: TextStyle(fontSize: 30)),
            ),

            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                // 스크롤 방향을 수평으로 설정
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: persons.length,
                itemBuilder: (BuildContext context, int index) {
                  return PersonTile(persons[index], index);
                },
              ),
            ),

            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[500],
              child: Text('Entry b', style: TextStyle(fontSize: 30)),
            ),

            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[300],
              child: Text('Entry c', style: TextStyle(fontSize: 30)),
            ),

            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[100],
              child: Text('Entry d', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      )
    );
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

// PersonTile 정의 =================================================
// ListTile 생성용 클래스
class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;
  // 추가 데이터는 생성자를 통해 추가할 수 있다.
  PersonTile(this._person, this.index);

  @override
  Widget build(BuildContext context){
    // ListTile 대신 Card 위젯을 사용해서 커스텀 디자인 적용
    return Card(
      // 배경색
      color: Colors.amber[100],
      elevation: 0,
      // 카드의 테두리 속성(색깔, 두께, 원형 적용)
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        // 카드 클릭시 스플레쉬되는 색깔 지정
        splashColor: Colors.blue,
        // 클릭했을 때 동작
        onTap: () {
          print('$index번 타일 클릭됨.');
        },

        child:  SizedBox(
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
                child: const Text('button', style: TextStyle(fontSize: 14)),
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
