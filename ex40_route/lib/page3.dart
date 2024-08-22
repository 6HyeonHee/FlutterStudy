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
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              style:  ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              /* Page2를 제거할 때 파라미터를 전달한다. Page1에서 열렸으므로
              여기로 전달된다. */
              onPressed: () {
                Navigator.pop(context, '3페이지에서 보냄(Pop)');
              },
            ),
            const SizedBox(height: 20),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        )
      ),
    );
  }
}