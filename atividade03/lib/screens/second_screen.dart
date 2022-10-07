import 'package:aula05_codigo_sala/bloc/form/check_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blue_bloc.dart';

import '../bloc/red_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final redState = context.watch<RedBloc>();
        final blueState = context.watch<BlueBloc>();
        final checkState = context.watch<CheckBoxBloc>().state;

        if (checkState == CheckBoxState.checked) {
          return Container(
              color: Color.fromRGBO(0, 0, blueState.state.amount, 1));
        } else {
          return Container(
              color: Color.fromRGBO(redState.state.amount, 0, 0, 1));
        }
      },
    );
  }
}
