import 'package:flutter/material.dart';
import 'package:gerenciador_estado/presenter/color_presenter.dart';
import 'package:gerenciador_estado/presenter/home_presenter.dart';
import 'package:gerenciador_estado/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePresenter(),
        ),
        ChangeNotifierProvider(
          create: (_) => ColorPresenter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
