import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form/check_bloc.dart';
import '../bloc/blue_bloc.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [myCheckbox(), const Text("Azulao Checkbox")]),
      ],
    );
  }

  @override
  Widget myCheckbox() {
    return BlocBuilder<CheckBoxBloc, CheckBoxState>(
        builder: (context, state) => Checkbox(
            value: state == CheckBoxState.checked ? true : false,
            onChanged: (bool? inValue) {
              if (inValue != null) {
                if (inValue) {
                  BlocProvider.of<CheckBoxBloc>(context)
                      .add(CheckBoxEvent.check);
                  BlueBloc bloc = BlocProvider.of<BlueBloc>(context);
                  return bloc.add(BlueEvent.muito);
                } else {
                  BlocProvider.of<CheckBoxBloc>(context)
                      .add(CheckBoxEvent.uncheck);
                }
              }
            }));
  }
}
