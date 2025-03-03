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
  final _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {

      final percent =
          _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
      // print(_scrollController.position.maxScrollExtent);
      // print(_scrollController.position.pixels);
      print(percent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
    );
  }
}
