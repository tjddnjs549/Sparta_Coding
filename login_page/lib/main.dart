import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'hello world',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          // 스크롤 가능하게 해준다 (wrap with widget)
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.network(
                    "https://i.ibb.co/nngK6j3/startup.png",
                    width: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                TextField(
                  obscureText: true, //가려짐
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                Container(
                  width: double.infinity, //자기 부모의 길이만큼 최대한 붙이겠다.
                  margin: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      print('click');
                    },
                    child: Text('로그인'),
                  ),
                ),
                Container(
                  // ElevatedButton은 길이 조절기능이 없어서 부모를 만들어야 함.
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      print('click');
                    },
                    child: Text('회원가입'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('click');
                        },
                        child: Text(
                          '아이디 찾기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('click');
                        },
                        child: Text(
                          '비밀번호 찾기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
