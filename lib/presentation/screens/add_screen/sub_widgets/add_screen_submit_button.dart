import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/application/addscreen_bloc/addscreen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenSubmitButton extends StatelessWidget {
  const AddScreenSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addContr = BlocProvider.of<AddScreenBloc>(context);
    return Column(
      children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  addContr.add(AddScreenSubmitClickedEvent(ctx: context));
                },
                child: const Text("Submit"))),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
