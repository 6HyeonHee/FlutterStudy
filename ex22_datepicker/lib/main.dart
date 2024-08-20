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
  // 별도의 설정 없이도 로컬 시간이 표시된다.
  String _selectedDate = DateTime.now().toString();

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
          children: <Widget>[
            // 현재날자 혹은 선택한 날짜
            Text('$_selectedDate', style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: () => selectDate(), 
              child: const Text('Show DatePicker', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }

  // 현재 날짜를 표시하기 위해 날짜를 구해서 반환.
  DateTime selectNowDate() {
    // 현재 시각을 구해온다.
    DateTime _now = DateTime.now();
    if (_now.weekday == 6) {
      // 오늘이 토요일이면 2일을 더함.
      _now = _now.add(Duration(days: 2));
    } else if (_now.weekday == 7) {
      // 오늘이 일요일이면 1일을 더함.
      _now = _now.add(Duration(days: 1));
    }
    /* 즉 평일인 경우에는 그대로 반환하고, 주말인 경우 다음주 월요일의
    날짜를 구해서 반환하는 기능을 필요한 경우에만 설정하면 된다. */
    return _now;
  }

  // 특정날짜, 요일등을 활성화/비활성화 시키는 메서드
  bool _predicate(DateTime day) {
    /* isAfter()와 isBefore()를 통해 활성화 할 날짜의 범위를
    설정할 수 있다. 단 오늘날짜가 포함된 범위로 지정해야 문제 없이
    앱을 실행할 수 있다.  */
    // if((day.isAfter(DateTime(2024, 1, 1)) &&
    //     day.isBefore(DateTime(2024, 8, 10)))) {
    //       return true; 
    // }

    // 토,일요일은 비활성화
    if (day.weekday != 6 && day.weekday != 7) {
      // 매달 25일 비활성화
      if(day != DateTime(day.year, day.month, 25)) {
        return true;
      }
      // return true;
    }

    // 매달 1일부터 리스트에 설정된 날짜까지를 비활성화
    // List days = [1, 2, 3, 4, 5, 6, 7];
    // if (!days.contains(day.day.toInt())) {
    //   return true;
    // }
    return false;
  }

  // 데이트피커를 오픈
  Future selectDate() async {
    DateTime _now = DateTime.now();
    
    /* 대화창이 표시되는 것은 시간이 걸리는 작업이므로 실행될때까지
    기다렸다가 표시한다. */
    DateTime? picked = await showDatePicker(
      context: context,
      // 초기 날짜. 메서드를 통해 표시.
      initialDate: selectNowDate(),
      // 선택 가능한 년도의 시작(2년전)
      firstDate: DateTime(_now.year - 2), 
      // 년도의 종료(2년후)
      lastDate: DateTime(_now.year + 2),
      // 달력의 날짜 비활성화 설정(메서드 호출을 통해 설정)
      selectableDayPredicate: _predicate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          // data: ThemeData.light(),
          data: ThemeData.dark(),
          // data: ThemeData(primarySwatch: Colors.pink), 
          child: child!,
        );
      },
    );

    // 날짜를 선택 후 OK를 누를 때 표시된 날짜를 변경한다.
    if(picked != null) {
      setState(() {
        _selectedDate = picked.toString().substring(0,10);
      });
    }
  }
}
