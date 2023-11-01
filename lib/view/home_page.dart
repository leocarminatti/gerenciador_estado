import 'package:flutter/material.dart';
import 'package:gerenciador_estado/presenter/color_presenter.dart';
import 'package:gerenciador_estado/presenter/home_presenter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late HomePresenter presenter;
  late ColorPresenter colorPresenter;

  @override
  void initState() {
    presenter = context.read<HomePresenter>();
    colorPresenter = context.read<ColorPresenter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Consumer<ColorPresenter>(
          builder: (context, value, child) => Text(
            widget.title,
            style: TextStyle(color: colorPresenter.color),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<HomePresenter>(
              builder: (context, controller, _) {
                return Text(
                  '${presenter.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<ColorPresenter>(
        builder: (context, value, _) {
          return FloatingActionButton(
            backgroundColor: colorPresenter.color,
            onPressed: () {
              presenter.incrementCounter();
              colorPresenter.serColor(presenter.counter);
              colorPresenter.loopColor();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
