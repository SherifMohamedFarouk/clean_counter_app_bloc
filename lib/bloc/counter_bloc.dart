import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;
    on<CounterEvent>((event, emit) {

      if(event is IncrementEvent){
        counter = counter +1;
        emit(CounterChangingState(counter: counter));
      }else if (event is DecrementEvent){
        if(counter>0) counter =counter - 1;

        emit(CounterChangingState(counter: counter));
      }else{
        counter = 0;
        emit(CounterChangingState(counter: counter));
      }

    });
  }
}
