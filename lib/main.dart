import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = 300.0;
    return Material(
      child: ListView(
        children: [
          Container(color: Colors.red, height: height),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, height: 100, width: 100),
                Container(color: Colors.yellow, height: 100, width: 100),
                Container(color: Colors.green, height: 100, width: 100),
                Container(color: Colors.yellow, height: 100, width: 100),
                Container(color: Colors.green, height: 100, width: 100),
                Container(color: Colors.yellow, height: 100, width: 100),
              ],
            ),
          ),
          Container(color: Colors.blue, height: height),
          Container(color: Colors.black, height: height),
        ],
      ),
    );
  }
}
