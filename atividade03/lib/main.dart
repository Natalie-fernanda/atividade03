import 'package:aula05_codigo_sala/bloc/blue_bloc.dart';
import 'package:aula05_codigo_sala/bloc/form/check_bloc.dart';
import 'package:aula05_codigo_sala/screens/third_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/red_bloc.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RedBloc(),
          ),
          BlocProvider(create: ((context) => BlueBloc())),
          BlocProvider(create: ((context) => CheckBoxBloc()))
        ],
        child: IndexedStack(
          index: _currentScreen,
          children: const [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Primeira"),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye), label: "Segunda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_sharp), label: "Terceira")
        ],
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
      ),
    );
  }
}
