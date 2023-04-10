part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangingState extends CounterState {
  final int counter;

  CounterChangingState({required this.counter});
}
