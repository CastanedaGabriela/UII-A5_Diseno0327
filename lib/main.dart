import 'package:flutter/material.dart';
import 'package:castaneda/transform_pv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Diseño Castaneda Gabriela"),
        ),
        body: const TransformPageView(),
      ),
    );
  }
}
