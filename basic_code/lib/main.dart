import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //runApp은 인수값으로 무조건 위젯이 들어가야한다.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App', //앱을 총칭하는 이름.
      theme: ThemeData(
          //앱의 기본적인 디자인 테마를 정함
          primarySwatch: Colors.red //특정색을 음영으로 정함.
          ),
      home: MyHomePage(), //home : 앱이 정상적으로 시작되었을 때 가장 먼저 화면에 보여지는 경로.
      // scaffold(~) 이렇게 바로 보여질 수 있음.(MyHomePage()가 코드가 적을 경우 사용하자.)
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('hello'),
            Text('hello'),
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
