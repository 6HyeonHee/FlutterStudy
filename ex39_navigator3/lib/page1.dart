import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';

class Page1 extends StatefulWidget {
  // 멤버 변수: 파라미터로 전달된 값을 받기 위해 선언
  String data = '';
  // 교안에 있는 생성자 코드(이전 버전에서 사용)
  // Page1({Key? key, required this.data}) : super(key: key);

  /* 새로운 현재 버전의 생성자 코드로 required로 선언하면 필수사항임을 명시할 수 있다.
  즉 생성자 호출 시 반드시 값을 받아 초기화해야한다. */
  Page1({Key? key, required this.data});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 첫번째 버튼을 누르면 2페이지를 추가(push)한다.
            ElevatedButton(
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
              onPressed: () async {
                // 멤버변수 data를 빈값으로 변경한다.
                setState(() {
                  widget.data = '';
                });
                /* Page2를 Stack에 추가한다. 즉 전환이 아니라 추가하는 것이다.
                 최초 Push()했을 때는 문제가 없지만, Pop()을 통해 Page2가
                 종료될때 Null에 대한 오류가 생기므로 Null Safety처리를 추가한다. */
                String? value = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    // Page2를 추가하면서 파라미터를 전달한다.
                    builder: (context) => Page2(
                      data: '1페이지에서 보냄(1->2)',
                    )
                  ),
                );
                /* 앞에서 Page2를 push해서 Stack에 추가하면 아래 코드는
                실행되지 않고, await 하게 된다. 즉 Page2가 닫힐때까지 대기했다가
                닫히는 순간 아래코드가 실행된다.
                Page2에서 콜백해준 데이터를 여기서 */
                print('result(1-1) : $value');
                setState(() {
                  // 만약 null이 들어왔다면 우측의 문자열을 대입한다.
                  widget.data = value ?? 'Nullㅠ';
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24)),
              onPressed: () async {
                // 멤버변수를 빈값으로 변경
                setState(() {
                  widget.data = '';
                });
                // Page3을 띄우고 닫힐때까지 대기한다.
                await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    // 파라미터 전달
                    builder: (context) => Page3(
                      data: '1페이지에서 보냄(1->3)',
                    )
                  ),
                ). then((value) {
                  /* Page3에서 콜백데이터가 정상적으로 넘어오는 then절이 실행된다.
                  내용을 콘솔에 출력한 후 화면을 새롭게 렌더링 한다. */
                  print('result(1-2) : $value');
                  setState(() {
                    // 만약 null 이면 우측의 문자열로 대체
                    widget.data = value ?? 'Null..ㅠ';
                  });
                });
              },
            ),
            /* Page1인스턴스 생성 시 파라미터로 전달된 데이터를 생성자를 통해
            초기화한 후 아래에서 출력한다. */
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}