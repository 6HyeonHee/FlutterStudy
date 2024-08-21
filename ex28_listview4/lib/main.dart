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
      body:
      /* 3. ListView.separated를 사용해서 Lazy 하게 생성.
        아이템 사이에 구분자도 Lazy하게 생성 */
      ListView.separated(
        // 아이템 갯수
        itemCount: persons.length,
        // 아이템빌더 내에서 출력할 Tile을 생성
        itemBuilder: (BuildContext context, int index) {
          // Person 인스턴스 외 추가 데이터인 index를 사용
          return PersonTile(persons[index], index);
        },
        // 구분선 표시
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black,
            /* 구분선은 아래 속성에 따라 다른 결과를 출력하므로 선택해서 사용한다. */
            // height: 1,
            thickness: 1.0,
          );
        },
      ),
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
        // 타일을 1차로 가로형 배치
        child: Row(
          children: [
            // 좌측 : 사이즈박스로 아이콘 표시
            SizedBox(
              width: 100,
              height: 150,
              child: Icon(
                Icons.account_box,
                size: 50.0,
              ),
            ),
            // 우측 : 남은 부분 전체에 이름, 버튼 등을 배치
            Expanded(
              // 2차로 세로형 배치
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이름
                  Text(
                    _person.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // 나이
                  Text(
                    "'${_person.age}세'",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  // 3차로 가로형 배치
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 타일의 인덱스 번호
                      Text(
                        '$index번 타일',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // 엘리베이트 버튼 추가. 크릭시 외부메서드 호출.
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          // 클릭 시 람다형식으로 외부 메서드 호출.
                          onPressed: () => _onClick(index), 
                          child: const Text('ElevatedButton', style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick(int index) {
    print('$index 클릭됨');
  }
}
