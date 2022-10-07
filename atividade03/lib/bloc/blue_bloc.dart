import 'package:flutter_bloc/flutter_bloc.dart';

enum BlueEvent { sem, pouco, normal, muito }

class BlueState {
  int amount;
  BlueState({this.amount = 0});
}

class BlueBloc extends Bloc<BlueEvent, BlueState> {
  BlueBloc() : super(BlueState(amount: 0)) {
    on<BlueEvent>((event, emit) {
      switch (event) {
        case BlueEvent.sem:
          emit(BlueState(amount: 0));
          break;
        case BlueEvent.pouco:
          emit(BlueState(amount: 80));
          break;
        case BlueEvent.normal:
          emit(BlueState(amount: 150));
          break;
        case BlueEvent.muito:
          emit(BlueState(amount: 250));
          break;
      }
    });
  }
}
