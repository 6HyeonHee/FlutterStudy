import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

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

  // Sqlite 사용을 위한 데이터베이스 인스턴스 변수
  late Future<Database> database;
  // 시퀀스를 사용할 변수
  int seqNum = 0;
  // 텍스트 필드에 입력된 내용을 읽어오기 위한 컨트롤러 인스턴스
  final ctlMyText1 = TextEditingController();

  @override
  void initState(){
    super.initState();
    // 앱이 최초 시작할 때 데이터 베이스 생성
    createDatabase();
  }

  // 각 플랫폼별로 데이터베이스의 경로를 생성하여 DB파일 추가
  void createDatabase() async {
    database = openDatabase(
      /* 테이블과 레코드를 저장하기 위한 DB파일 생성. 오라클이라면
      새로운 계정을 생성하는 것과 동일하다. */
      join(await getDatabasesPath(), 'telbook.db'),
      onCreate: (db, version) {
        // 전화번호부로 db 생성
        return db.execute(
          "CREATE TABLE telbook(" + 
          " id INTEGER PRIMARY KEY, name TEXT, telnum TEXT) ",
        );
      },
      version: 1,
    );
  }

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
            ElevatedButton(
              onPressed: () => doInsert(), 
              child: const Text('Insert', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => doSelectAll(), 
              child: const Text('Select All', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 10,),
            // 텍스트 필드 외부에서 사이즈 박스를 통해 너비 지정
            SizedBox(
              width: 240,
              // 입력을 위한 텍스트필드 생성 및 컨트롤러 추가
              child: TextField(
                controller: ctlMyText1,
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                // 텍스트 필드에 입력한 값을 얻어온다.
                var sNum = ctlMyText1.text;
                // 값을 int 형으로 변환한다.
                int nNum = int.parse(sNum);
                // 메서드 호출 시 인수로 전달한다.
                doSelectOne(nNum);
              }, 
              child: const Text('Select One', style: TextStyle(fontSize: 24)),
            ),
            /*
             수정 삭제도 동일하게 입력된 값을 받아와서 메서드 호출
            */
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doUpdate(nNum);
              }, 
              child: const Text('Update', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doDelete(nNum);
              }, 
              child: const Text('Delete', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
  
  void doSelectAll() async {
    final Database db = await database;

    List<Map> datas = await db.rawQuery('select * from telbook');
    if (datas.length > 0) {
      for(int i=0; i<datas.length; i++) {
        int id = datas[i]['id'];
        String name = datas[i]['name'];
        String telnum = datas[i]['telnum'];

        print('$id $name $telnum');
      }
    } else {
      print('SelectAll : 데이터가 없습니다.');
    }
  }

  void doSelectOne(int num) async {
    final Database db = await database;

    List<Map> data = await db.rawQuery('select * from telbook where id = $num');

    if(data.length > 0) {
      int id = data[0]['id'];
      String name = data[0]['name'];
      String telnum = data[0]['telnum'];

      print('$id $name $telnum');
    } else {
      print('SelectOne : 데이터가 없습니다.');
    }
  }

  Future<void> doInsert() async {
    final Database db = await database;

    seqNum = seqNum + 1;
    var telnum = '010-1234-$seqNum$seqNum$seqNum$seqNum';

    int count = await db.rawInsert(
      'insert into telbook (id,name,telnum) values (?,?,?)',
      [seqNum, '홍길동$seqNum', telnum]
    );

    print('Insert : $count');
  }

  Future<void> doUpdate(int id) async {
    final db = await database;

    int count = await db.rawUpdate(
      'update telbook set name = ?, telnum = ? where id = ?',
      ['손오공', '010-1234-xxxx', id]
    );

    print('Update : $count');
  }

  Future<void> doDelete(int id) async {
    final db = await database;

    int count = await db.rawDelete(
      'delete from telbook where id = ?',
      [id]
    );

    print('Delete : $count');
  }

  Future<void> doDeleteAll() async {
    final db = await database;

    int count = await db.rawDelete('delete from telbook');

    print('DeleteAll : $count');
  }
}
