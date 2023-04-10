import 'package:clean_counter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              if(state is CounterChangingState){
                return Text(
                  state.counter.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              }else if(state is CounterInitial){
                return Text(
                  '0',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              }else{
                return SizedBox();
              }
            })
          ],
        ),
      ),
      floatingActionButton: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).addCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).restCounter();
            },
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).minusCounter();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
