import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SecondScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Second Screen")),
      ),
      body: Container(
        color:Colors.cyan,
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Text("Second Screen", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}