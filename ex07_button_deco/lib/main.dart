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
  // 멤버변수 선언
  String name = "클릭하세요!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 텍스트위젯. 각 버튼 클릭시 변화되는 값을 출력
          Text(
            /* 문자열 표현식만 있는 경우에는 $를 사용하지 않는 것이 좋다.
            다른 문자열과 연결되는 부분이 있는경우에만 $를 사용하는 것을 권장한다 */
            '$name',
            style: const TextStyle(fontSize: 30, height: 1.5),
          ),
          /* TextButton은 테투리가 없다. 즉 HTML에서 텍스트에 <a> 태그를
          사용한 것과 비슷함. */
          TextButton(
            onPressed: (){
            setState(() {
              name = "전우치";
            });
          }, child: const Text('TextButton', style: TextStyle(fontSize:24, color: Colors.red))
          ),
          // 텍스트 + 아이콘이 추가된 버튼
          TextButton.icon(
            icon : const Icon(Icons.add_circle, size: 24.0),
            label: const Text ('TextButton + icon', style: TextStyle(fontSize: 24, color: Colors.red)),
            onPressed: (){
              /* 단순히 변수의 값을 변경할 때는 setState가 필요없지만,
              변경과 동시에 화면을 변경해야할 때 사용한다. */
              setState(() {
                name = "전우치(icon)";
              });
            }
          ),
          TextButton(
            child:  const Text('TextButton'),
            style: TextButton.styleFrom(
              // primary: Colors.white,
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
              shadowColor: Colors.red,
              elevation: 5,
              side: const BorderSide(color: Colors.red, width:1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: (){
              setState(() {
                name = "전우치(back-color)";
              });
            }
          ),
          /* 이버튼은 ElevatedButton과 TextButton의 중간정도의 위치를
          가지는 위젯으로 텍스트 주변의 테두리가 디폴트로 표현됨. */
          OutlinedButton(
            onPressed: () {
              // 외부에 정의한 함수 호출
              _onClick1(1);
            }, 
            child: const Text('OutlinedButton',
            style: TextStyle(fontSize: 24, color: Colors.red)),
          ),
          // 외곽선 버튼 + 아이콘
          OutlinedButton.icon(
            icon: const Icon(Icons.web, size: 24.0),
            label: const Text('OutlinedButton', style: TextStyle(fontSize:24, color:Colors.red)),
            onPressed: () {
              _onClick1(2);
            }, 
          ),
          OutlinedButton(
            child: const Text('OutlnedButton'),
            style: OutlinedButton.styleFrom(
              // 컬러리를 지정한 속성 에러 발생됨. (24년 8월)
              // primary: Colors.white,
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
              shadowColor: Colors.red,
              elevation: 5,
              side: const BorderSide(color: Colors.red, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: (){
              _onClick1(3);
            }
          ),
          /* 플러터 앱에서 가장 많이 사용되는 버튼 */
          ElevatedButton(
            child: const Text('ElevatedButton',
            style: TextStyle(fontSize: 24, color: Colors.white)),
            onPressed: () => _onClick1(4),
          ),
          // 엘리베이트 + 아이콘 버튼
          ElevatedButton.icon(
            icon: const Icon(Icons.web, size:24.0),
            label: const Text('ElevatedButton',
            style: TextStyle(fontSize: 24, color: Colors.white)),
            onPressed: ()=>_onClick1(5),
          ),
          ElevatedButton(
            child: const Text('ElevatedButton'),
            style: ElevatedButton.styleFrom(
              // 아래 속성은 현재버전에서 에러 발생 따라서 아래처럼 변경
              // primary: Colors.green,
              // onPrimary: Colors.white,
              foregroundColor: Colors.green,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
              shadowColor: Colors.red,
              elevation: 5,
              side: const BorderSide(color: Colors.red, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            onPressed: ()=> _onClick1(6),
          ),

          // 가로형 배치에 사용되는 레이아웃 위젯
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_box),
                iconSize: 60.0,
                color: Colors.blue,
                /* 버튼을 롱클릭시 툴팁이 표현됨. 앱은 손가락을 올리는
                순간 이벤트가 발생되므로 over와 같은 이벤트는 존재하지 않음. */
                tooltip: "툴팁입니다.",
                onPressed: _onClick2,
              ),
              // 이미지 에셋을 이용한 버튼
              IconButton(
                /* 이미지를 활용한 버튼의 크기는 asset내부에 width 속성으로
                설정할 수 있다. */
                icon: Image.asset('assets/images/300x100.png', width: 100,),
                tooltip: "툴팁입니다.",
                onPressed: ()=>_onClick2(),
              ),
            ],
          ),
        ],
      ),
      // 플러터 프로젝트 생성 시 기본형으로 생성되는 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClick3(),
        tooltip: '앱에서는 롱터치에 툴팁을 보여줍니다.',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onClick1(int kind) {
    setState(() {
      switch(kind){
        case 1: name = "홍길동"; break;
        case 2: name = "홍길동(icon)"; break;
        case 3: name = "홍길동(back-color)"; break;
        case 4: name = "손오공"; break;
        case 5: name = "손오공(icon)"; break;
        case 6: name = "손오공(back-color)"; break;
        default:
      }
    });
  }

  void _onClick2() {
    setState(() {
      name = "해리포터";
    });
  }

  void _onClick3() {
    setState(() {
      name = "클릭하세요!";
    });
  }
}
