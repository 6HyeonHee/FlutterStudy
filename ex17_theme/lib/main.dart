import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // 현재 사용되고 있는 기본 테마
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // useMaterial3: true,

    // theme: ThemeData.dark(),
      theme: ThemeData(
        // Appbar와 전반적인 컬러로 테마 구성 (구 버전에서 default로 사용됨)
      // primarySwatch: Colors.blue,
        primarySwatch: Colors.orange,

        // Appbar의 테마 설정
      // appBarTheme: const AppBarTheme(
      //   color: Colors.deepPurple,
      // ),

        // 선택되지 않은 위젯의 색
        unselectedWidgetColor: Colors.green,
        
        // scaffold 디자인의 배경 색
      // scaffoldBackgroundColor: Colors.yellow[50],
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 235, 231),

        fontFamily: 'D2Coding',
        textTheme: const TextTheme(
          // bodyText2는 deprecated 되었으므로 bodyMedium으로 변경
        // bodyText2: TextStyle(
          bodyMedium: TextStyle(
            fontSize: 30,
            height: 1.5,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Theme Use'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 열거형 상수 선언
enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {

  // 멤버변수
  Fruit _myGroup = Fruit.banana;
  bool _chk1 = false;
  bool _chk2 = true;

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
          children: [
            const Text(
              'Default Theme Text',
            ),
            TextButton(
              onPressed: 1 != 2 ? null : () => print('aaa'),
              child: const Text(
                'TextButton 0'
              )
            ),
            ElevatedButton(
              onPressed: () {
                print('bbb');
              },
              child: const Text(
                'Default Theme Button 0',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('ccc');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text(
                'Text Color Changed Button 0',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            RadioListTile(
              title: const Text('사과'),
              groupValue: _myGroup,
              value: Fruit.apple,
              onChanged: (value) {
                setState(() {
                  _myGroup = value!;
                  print(_myGroup);
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.indigo,
              ),
              child: RadioListTile <Fruit>(
                title: const Text('바나나'),
                groupValue: _myGroup,
                value: Fruit.banana,
                // 체크되었을 때 색
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    _myGroup = value!;
                    print(_myGroup);
                  });
                },
              ),
            ),
            Checkbox(
              value: _chk1,
              // 체크되었을 때 체크의 색
              checkColor: Colors.pink,
              // 체크되었을 때 배경 색
              activeColor: Colors.green,
              // 노멀 상태의 배경색은 테마로 변경
              onChanged: (value) {
                setState(() {
                  _chk1 = value!;
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.indigo,
              ),
              child: Checkbox(
                value: _chk2,
                checkColor: Colors.pink,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _chk2 = value!;
                  });
                },
              ),
            ),
            const TextField(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.thumb_up),
        label: const Text('Approve'),
        tooltip: 'Increment',
        backgroundColor: Colors.purple,
        onPressed: () {
          print('ddd');
        },
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      //   ),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     tooltip: 'Increment',
      //     onPressed: () => (print('ddd')),
      //   ),
      // ),
    );
  }
}
