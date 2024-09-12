import 'package:storage/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
  apiKey: 'AIzaSyAj0wPCjPo8DIFkDZQ3Z8rYA2drcA', 
  appId: '1:797812177122:android:2e3c09fee600269edf46bb', 
  messagingSenderId: '797812177122', 
  projectId: 'flutterapp4-60c46',
  storageBucket: 'flutterapp4-60c46.appspot.com'
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
      home: const HomeScreen(),
    );
  }
}