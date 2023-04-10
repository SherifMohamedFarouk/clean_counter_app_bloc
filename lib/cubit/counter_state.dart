part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangingState extends CounterState {
  final int counter;

  CounterChangingState({required this.counter});
}
