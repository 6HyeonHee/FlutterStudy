import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

FirebaseOptions get firebaseOptions => const FirebaseOptions(
  apiKey: 'AIzaSyAj0wPCjPo8DIFkDZQ3Z8rYA2drcA', 
  appId: '1:797812177122:android:8302e0fcb958e23edf46bb', 
  messagingSenderId: '797812177122', 
  projectId: 'flutterapp4-60c46'
);

class _MyHomePageState extends State<MyHomePage> {

  String appName = '';

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(options: firebaseOptions);
    appName = app.name;
    print('초기화된 디폴트 App : $app');
  }
  
  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print("초기화된 Apps List : $apps");
  }

  void options() {
    final FirebaseApp app = Firebase.app(appName);
    final FirebaseOptions? options = app.options;
    print("초기화 옵션 $appName : $options");
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
              onPressed: initializeDefault, 
              child: const Text('디폴트 앱 초기화')
            ),
            ElevatedButton(
              onPressed: apps, 
              child: const Text('앱 리스트')
            ),
            ElevatedButton(
              onPressed: options, 
              child: const Text('초기화 옵션')
            ),
          ],
        ),
      ),
    );
  }
}
