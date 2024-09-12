import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
  apiKey: 'AIzaSyAj0wPCjPo8DIFkDZQ3Z8rYA2drcA', 
  appId: '1:797812177122:android:ad582816aef079cedf46bb', 
  messagingSenderId: '797812177122', 
  projectId: 'flutterapp4',
  databaseURL : 'https://flutterapp4-60c46-default-rtdb.asia-southeast1.firebasedatabase.app/',
);

Future<void> main() async{
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

  int _counter = 0;

  late DatabaseReference _counterRef;
  late DatabaseReference _messageRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  late StreamSubscription<DatabaseEvent> _messageSubscription;
  bool _anchorToBottom = false;

  final String _kTestKey = 'Hello';
  final String _kTestValue = 'world!';
  FirebaseException? _error;

  @override
  void initState() {
    super.initState();

    _counterRef = FirebaseDatabase.instance.ref('counter');
    _messageRef = FirebaseDatabase.instance.ref('messages');

    // 리스너 설정 - 데이터베이스의 값이 변하면 앱에 반영된다.
    _counterSubscription = _counterRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _error = null;
        _counter = (event.snapshot.value ?? 0) as int;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        _error = error;
      });
    });

    _messageSubscription = _messageRef
      .limitToFirst(10)
      .onChildAdded.listen((DatabaseEvent event) {
        print('Child added : ${event.snapshot.value}');
      }, onError: (Object o) {
        final error = o as FirebaseException;
        print('Error: ${error.code} ${error.message}');
      });
  }

  @override
  void dispose() {
    super.dispose();
    _messageSubscription.cancel();
    _counterSubscription.cancel();
  }

  Future<void> _increment() async {
    await _counterRef.set(ServerValue.increment(1));

    await _messageRef
      .push()
      .set(<String, String>{_kTestKey: '$_kTestValue $_counter'});
  }

  Future<void> _incrementAsTransaction() async {
    try {
      final transactionResult = await _counterRef.runTransaction((mutableData) {
        return Transaction.success((mutableData as int? ?? 0) + 1);
      });

      if (transactionResult.committed) {
        final newMessageRef = _messageRef.push();
        await newMessageRef.set(<String, String> {
          _kTestKey: '$_kTestValue ${transactionResult.snapshot.value}'
        });
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<void> _deleteMessage(DataSnapshot snapshot) async {
    final messageRef = _messageRef.child(snapshot.key!);
    await messageRef.remove();
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
            Flexible(
              child: Center(
                child: _error == null
                  ? Text(
                    'Button tapped $_counter time${_counter == 1 ? '' : 's'}.\n\n'
                    'This includes all devices, ever.',
                  )
                  : Text(
                    'Error retrieving button tap count:\n${_error!.message}'
                  ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _incrementAsTransaction();
              }, 
              child: const Text('Increment as transaction'),
            ),
            ListTile(
              title: const Text('Anchor to bottom'),
              leading: Checkbox(
                onChanged: (bool? value) {
                  if (value != null){
                    setState(() {
                      _anchorToBottom = value;
                    });
                  }
                },
                value: _anchorToBottom,
              ),
            ),
            Flexible(
              child: FirebaseAnimatedList(
                key: ValueKey<bool>(_anchorToBottom),
                query: _messageRef,
                reverse: _anchorToBottom, 
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () => _deleteMessage(snapshot), 
                        icon: const Icon(Icons.delete),
                      ),
                      title: Text(
                        '$index: ${snapshot.value.toString()}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
