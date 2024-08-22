import 'package:flutter/material.dart';
import 'page2.dart';

class Page3 extends StatefulWidget {
  String data = '';
  Page3({Key? key, required this.data}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Page3에서 제거하는 코드는 Page2와 동일하게 작성되어있다. */
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pop(context, '3페이지에서 보냄(Pop)');
              },
            ),
            const SizedBox(height: 20),
            // 화면 전환시 파라미터를 전달한다.(Page2와 동일하게 작성됨.)
            ElevatedButton(
              child: const Text('2페이지로 변경', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Page2(
                      data: '3페이지에서 보냄 (Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}