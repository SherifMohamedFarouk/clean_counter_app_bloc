import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;
  CounterCubit() : super(CounterInitial());



  void addCounter(){
    counter++;
    emit(CounterChangingState(counter: counter));
  }


  void minusCounter(){
    counter--;
    emit(CounterChangingState(counter: counter));
  }


  void restCounter(){
    counter = 0;
    emit(CounterChangingState(counter: counter));
  }


}
