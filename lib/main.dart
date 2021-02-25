import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoutnerCubit extends Cubit<int> {
  static var dozecount = 0;
  static var singlecount1 = 0;
  static var totalbagels = 0;

  CoutnerCubit() : super(0);

  void increment() {
    totalbagels = ((state) + 1);
    dozecount = ((state +1) ~/ 13);
    singlecount1 = ((state +1) % 13);
    print("state: $state");
    print("totalbagels: $totalbagels");
    print("dozecount: $dozecount");
    print("singlecount1: $singlecount1");

    //holdtotal = ((state + 1) ~/ 13);
    // holdsingle = ((state. + 1) % 13);

    emit(
      state +1,
      // state + 1, past working
    );
  }
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
        bottomNavigationBar: BottomAppBar(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            //IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            Container(
              height: 55.0,
              width: 1.0,
            ),
            //TODO get bakerdoz and etotal on footer working need to pass data between main and bagelcounter

            //int f(CounterCubitState c) => c.dozcount.to;
            BlocBuilder<CoutnerCubit, int>(builder: (context, state) {
              //return Text("state: $state",
              return Text(
                  "Total: $state > Dozen: ${CoutnerCubit.dozecount} > Single: ${CoutnerCubit.singlecount1}",

                  //Text("Baker's Dozen:" + (int f(CounterCubitState c) => c.dozcount.to.toStringAsExponential(2)),
                  //Text("Baker's Dozen:"  + int funterCubitState.dozcount.toStringAsExponential(2),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500));

              //Spacer(),
              //IconButton(icon: Icon(Icons.search), onPressed: () {}),
              //IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            }),
          ]),
          shape: CircularNotchedRectangle(),
          color: Colors.lightBlue,
          notchMargin: 8.0,
        ));
  }
}
