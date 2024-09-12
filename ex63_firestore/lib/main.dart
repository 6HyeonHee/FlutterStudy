import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
  apiKey: 'AIzaSyAj0wPCjPo8DIFkDZQ3Z8rYA2drcA', 
  appId: '1:797812177122:android:dad157e807b50c3fdf46bb', 
  messagingSenderId: '797812177122', 
  projectId: 'flutterapp4-60c46',
  storageBucket: 'flutterapp4-60c46.appspot.com',
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
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

  late CollectionReference members;
  int seqNum = 0;
  final ctlMyText1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    members = FirebaseFirestore.instance.collection('members');
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
              child: const Text('회원정보 추가',
                            style: TextStyle(fontSize: 24)),
            ),
            SizedBox(
              width: 240,
              child: TextField(
                controller: ctlMyText1,
              ),
            ),

            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => doSelectOne(), 
              child: const Text('회원정보 조회',
                            style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () => doUpdate(), 
              child: const Text('회원정보 수정',
                            style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () => doDelete(), 
              child: const Text('회원정보 삭제',
                            style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> doInsert() async {
    // 회원 정보를 firestore 문서로 추가
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    await members.doc( sId ).get();
    members.doc( sId ).set({
      'pw' : '1234',
      'email' : 'test1@test.com',
    });
  }

  void doSelectOne() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc( sId ).get();
    if(documentSnapshot.data() != null) {
      String pw = documentSnapshot.get('pw');
      String email = documentSnapshot.get('email');
      print('pw : $pw');

      print('email : $email');
    } else {
      print('회원정보가 존재하지 않습니다.');
    }
  }

  Future<void> doUpdate() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc( sId ).get();
    if(documentSnapshot.data() != null) {
      members.doc( sId ).update({
        'email' : 'xxx@test.com',
      });
    } else {
      print('회원정보가 존재하지 않습니다.');
    }
  }

  Future<void> doDelete() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc( sId ).get();
    if (documentSnapshot.data() != null) {
      var documentReference = members.doc( sId );
      documentReference.delete();
    } else {
      print('회원 정보가 존재하지 않습니다.');
    }
  }

}
