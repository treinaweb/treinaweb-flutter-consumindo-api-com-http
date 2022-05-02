import 'package:cadastro/cadastro.dart';
import 'package:cadastro/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (ctx) => const HomeView(),
        "/cadastro": (ctx) => const CadastroView(),
      },
      initialRoute: "/home",
    );
  }
}
