import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoutnerCubit extends Cubit<int> {
  CoutnerCubit() : super(0);

  void increment() => emit(state + 1);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CoutnerCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter'),
      ),
      body: Center(child: BlocBuilder<CoutnerCubit, int>(
        builder: (context, state) {
          return Text(
            '$state',
            style: Theme.of(context).textTheme.headline1,
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CoutnerCubit>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
