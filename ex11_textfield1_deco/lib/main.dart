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

  // 멤버변수: 커스텀 카운터와 입력 값 확인
  int _count = 0;
  String _myText = 'TextField 사용 예제';
  // 입력 값을 얻어오기 위한 컨트롤러 인스턴스 생성
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();
  
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text 위젯: 기본 문구 출력
            Text(
              _myText,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            // 간격 조정을 위한 SizedBox
            const SizedBox(
              height: 20,
            ),
            /* 입력 값이 없는 TextField,
            SizedBox를 통해 크기 지정이 안되어있으므로 가로 전체 영역에 표시된다. */
            TextField(
              controller: ctlMyText1,
            ),
            // 간단한 간격 조정
            const SizedBox(
              height: 20,
            ),
            // 입력된 텍스트의 길이를 출력하는 커스텀 카운터 (개발자 정의)
            Text(
              '$_count / 10',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
            // TextField의 너비를 SizedBox를 통해 외부에서 지정
            SizedBox(
              width: 240,
              child: TextField(
                // 컨트롤러 지정
                controller: ctlMyText2,
                // 커서의 색과 두께
              // cursorColor: Colors.red,
              // cursorWidth: 4.0,
                // 입력할 문자의 최대 길이 지정
                maxLength: 10,
                // 입력된 문자 숨김 처리 (html의 password 속성과 동일)
                obscureText: true,
                // 활성화, 비활성화 설정
                enabled: true,
                /* 키보드의 타입으로 TextField에 포커싱되면 자동으로 키보드가 올라온다.
                일반적인 쿼티나 이메일, 숫자 형식으로 변경할 수 있다. */
              // keyboardType: TextInputType.number,
              // keyboardType: TextInputType.emailAddress,
                // TextField의 테두리나 아이콘에 대한 스타일 지정
                decoration: const InputDecoration(
                  // border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  // 입력을 위해 포커싱되었을 때 테두리 색
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                      width: 1.0,
                    ),
                  ),
                  // 활성화되었을 때 테두리 색
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  // 비활성화되었을 때 테두리 색
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.perm_identity,
                  ),
                // prefixText: 'PW',
                  // 플로팅되는 입력 힌트
                  labelText: 'PassWord',
                  // 입력 상자 하단에 표시되는 입력 힌트
                // helperText: '비밀번호를 입력하세요.',
                  /* 입력된 텍스트의 제한 길이와 입력된 길이를 보여주는 옵션으로
                  빈 값으로 지정하면 숨김 처리된다.
                  주석 처리하면 박스 하단에 보여진다. */
                // counterText: '',
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.yellow,
                  ),
                ),
                // 입력 값이 변할 때마다 이벤트가 발생된다.
                onChanged: (text) {
                  /* 입력된 텍스트의 길이를 얻어와서 변수에 할당한 후
                  화면을 새롭게 렌더링 한다. */
                  setState(() {
                    _count = text.length;
                  });
                  print('$text - $_count');
                },
                // 포커싱된 상태에서 엔터 키를 누르면 이벤트가 발생된다.
                onSubmitted: (text) {
                  print('Submitted: $text');
                },
              ),
            ),
            OutlinedButton(
              child: const Text(
                '텍스트 지우기',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
              /* 입력 값이 없는 TextField의 내용을 얻어와서 변수에 할당한다.
              즉, 빈 텍스트를 할당하는 것이므로 텍스트를 지운다. */
              onPressed: () {
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
            ),
          ],
        ),
      ),
      // 플로팅 버튼을 누르면 입력된 값이 텍스트 위젯에 적용된다.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextField Submit',
        child: const Icon(
          Icons.send,
        ),
      ),
    );
  }
}
