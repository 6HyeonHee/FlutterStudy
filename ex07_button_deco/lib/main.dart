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
      home: const MyHomePage(title: '### Flutter Basic ###'),
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
  // 멤버변수
  String name = '클릭하세요!';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // 텍스트 위젯, 각 버튼 클릭 시 변화되는 값을 출력한다.
          Text(
            /* '$name', => name,
            : 문자열 표현식만 있는 경우에는 $를 사용하지 않는 것이 좋다.
            다른 문자열과 연결되는 부분이 있는 경우에만 $를 사용하는 것을 권장한다. */
            name,
            // 자동으로 지정되는 영문과 한글의 글자 높이가 달라 지정
            style: const TextStyle(
              fontSize: 30, height: 1.5),
          ),
          /* TextButton은 테두리가 없다.
          즉, html에서 텍스트에 <a> 태그를 사용한 것과 비슷하다. */
          TextButton(
            child: const Text(
              'TextButton',
              style: TextStyle(
                fontSize: 24, color: Colors.blue,
                decoration: TextDecoration.underline, decorationColor: Colors.blue)),
            // 직접 구현
            onPressed: () {
              /* 단순히 변수의 값을 변경할 때는 setState가 필요없지만
              변경과 동시에 화면을 변경해야 할 때는 사용해야 한다. */
              setState(() {
                name = 'TextButton #1';
              });
            }
          ),
          // 텍스트 + 아이콘이 추가된 버튼
          TextButton.icon(
            icon: const Icon(
              Icons.add_circle, size: 24.0),
            label: const Text(
              'TextButton + Icon',
              style: TextStyle(
                fontSize: 24, color: Colors.blue,
                decoration: TextDecoration.underline, decorationColor: Colors.blue)),
            // text color, 앞의 red가 적용된다.
          // style: TextButton.styleFrom(
          //   primary: Colors.blue),
            // 직접 구현
            onPressed: () {
              setState(() {
                name = 'TextButton #2';
              });
            }
          ),
          TextButton(
            child: const Text(
              'TextButton + Custom'),
            style: TextButton.styleFrom(
              /* 아래 속성은 현재 버전에서 에러가 발생하므로 변경해준다.
              primary => foregroundColor,
              onPrimary => backgroundColor */
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20, fontStyle: FontStyle.italic),
              shadowColor: Colors.black,
              elevation: 5,
              side: const BorderSide(
                color: Colors.teal, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            // 직접 구현
            onPressed: () {
              setState(() {
                name = 'TextButton #3';
              });
            }
          ),
          /* ElevatedButton과 TextButton의 중간 정도의 위젯으로
          텍스트 주변의 테두리가 기본으로 표현된다. */
          OutlinedButton(
            child: const Text(
              'OutlinedButton',
              style: TextStyle(
                fontSize: 24, color: Colors.purple)),
            // 외부에 정의한 함수 호출
            onPressed: () {
              _onClick1(1);
            }
          ),
          // 외곽선 버튼 + 아이콘
          OutlinedButton.icon(
            icon: const Icon(
              Icons.web, size: 24.0),
            label: const Text(
              'OutlinedButton + Icon',
              style: TextStyle(
                fontSize: 24, color: Colors.purple)),
            // 함수 호출
            onPressed: () {
              _onClick1(2);
            }
          ),
          OutlinedButton(
            child: const Text(
              'OutlinedButton + Custom'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20, fontStyle: FontStyle.italic),
              shadowColor: Colors.black,
              elevation: 5,
              side: const BorderSide(
                color: Colors.teal, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            // 함수 호출
            onPressed: () {
              _onClick1(3);
            }
          ),
          // 플러터 앱에서 가장 많이 사용되는 버튼
          ElevatedButton(
            child: const Text(
              'ElevatedButton',
              style: TextStyle(
                fontSize: 24, color: Colors.lightGreen)),
            // 함수 호출
            onPressed: () => _onClick1(4),
          ),
          // 엘리베이트 + 아이콘 버튼
          ElevatedButton.icon(
            icon: const Icon(
              Icons.web, size: 24.0),
            label: const Text(
              'ElevatedButton + Icon',
              style: TextStyle(
                fontSize: 24, color: Colors.lightGreen)),
            // 함수 호출
            onPressed: () => _onClick1(5),
          ),
          ElevatedButton(
            child: const Text(
              'ElevatedButton + Custom'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20, fontStyle: FontStyle.italic),
              shadowColor: Colors.black,
              elevation: 5,
              side: const BorderSide(
                color: Colors.teal, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            // 함수 호출
            onPressed: () => _onClick1(6),
          ),
          // 가로형 배치에 사용되는 레이아웃 위젯
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add_box),
                iconSize: 60.0,
                color: Colors.blue,
                /* 버튼을 롱 클릭 시 툴팁이 표현된다.
                앱은 손가락을 올리는 순간 이벤트가 발생하므로
                over와 같은 이벤트는 존재하지 않는다. */
                tooltip: '툴팁입니다.',
                // 함수 이름을 대입
                onPressed: _onClick2,
              ),
              IconButton(
                /* 이미지를 활용한 버튼의 크기는
                asset 내부에 width 속성으로 설정할 수 있다. */
                icon: Image.asset(
                  'assets/images/300x100.png', width: 100,),
                tooltip: '툴팁입니다.',
              // iconSize: 100.0,
                onPressed: () => _onClick2(),
              ),
            ],
          ),
        ],
      ),
      // 플러터 프로젝트 생성 시 기본형으로 생성되는 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClick3(),
        tooltip: '앱에서는 롱 터치 시 툴팁을 보여줍니다.',
        child: const Icon(
          Icons.add),
      ),
    );
  }

  void _onClick1(int kind) {
    setState(() {
      switch (kind) {
        case 1:
          name = 'OutlinedButton #1';
          break;
        case 2:
          name = 'OutlinedButton #2';
          break;
        case 3:
          name = 'OutlinedButton #3';
          break;
        case 4:
          name = 'ElevatedButton #1';
          break;
        case 5:
          name = 'ElevatedButton #2';
          break;
        case 6:
          name = 'ElevatedButton #3';
          break;
        default:
      }
    });
  }

  void _onClick2() {
    setState(() {
      name = 'IconButton';
    });
  }

  void _onClick3() {
    setState(() {
      name = 'floatingActionButton';
    });
  }
}