import 'package:flutter/material.dart';
import 'page3.dart';

class Page2 extends StatefulWidget {

  // 파라미터를 전달받을 멤버변수와 생성자 정의
  String data = '';
  Page2({Key? key, required this.data}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 이 버튼을 누르면 Page2가 스택에서 제거되면 파라미터를 
            보내게된다. 현재 Page1이 스택 아래쪽에 있는 상태이므로 파라미터가
            전달되게 된다. */
            ElevatedButton(
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pop(context, '2페이지에서 보냄(Pop)');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('3페이지로 변경', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                /* 화면을 전환하면서 파라미터를 전달한다. 
                즉 Page2를 제거하고 Page3이 스택에 추가되는 형식이된다.
                이경우 1페이지로 다시 돌아오더라도 텍스트 위젯에 메세지가 출력되지 않는다. */
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Page3(
                      data: '2페이지에서 보냄 (Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            // Page1에서 전송한 파라미터를 여기서 출력한다.
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}