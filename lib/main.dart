import 'dart:ui';

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

  var scrollFactor = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final percent =
          _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
      // print(_scrollController.position.maxScrollExtent);
      // print(_scrollController.position.pixels);
      // print(percent);

      setState(() {
        scrollFactor = percent;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double opacityAnimation = Interval(0.2, 0.4).transform(scrollFactor);
    double translateYFactor = Interval(0.2, 0.4).transform(scrollFactor);
    double? translateYAnimation = lerpDouble(-50, 30, translateYFactor);

    return Material(
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
          Positioned(
            bottom: translateYAnimation,
            right: 30,
            child: Opacity(
              opacity: opacityAnimation,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_upward_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
