import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/application/addscreen_bloc/addscreen_event.dart';
import 'package:customer_app/presentation/screens/add_screen/sub_widgets/add_screen_submit_button.dart';
import 'package:customer_app/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenTextFields extends StatelessWidget {
  const AddScreenTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final addContr = BlocProvider.of<AddScreenBloc>(context);
    return ListView(
      children: [
        CommonWidgets.customTextField(
            hint: "Pan Number",
            maximumLength: 10,
            contr: addContr.panController),
        CommonWidgets.customTextField(
            hint: "Full Name",
            maximumLength: 140,
            contr: addContr.nameController),
        CommonWidgets.customTextField(
            hint: "Email",
            contr: addContr.emailController,
            keyboardType: TextInputType.emailAddress,
            maximumLength: 255),
        Row(
          children: [
            Expanded(
              child: CommonWidgets.customTextField(
                  hint: "country",
                  maximumLength: 3,
                  isReadable: true,
                  contr: TextEditingController(text: "+91")),
            ),
            Expanded(
              flex: 5,
              child: CommonWidgets.customTextField(
                hint: "Mobile Number",
                contr: addContr.mobileController,
                keyboardType: TextInputType.number,
                maximumLength: 10,
              ),
            ),
          ],
        ),
        CommonWidgets.customTextField(
            hint: "Address Line 1", contr: addContr.address1Controller),
        CommonWidgets.customTextField(
            hint: "Address Line 2", contr: addContr.address2Controller),
        CommonWidgets.customTextField(
            hint: "pincode",
            keyboardType: TextInputType.number,
            contr: addContr.pinController,
            sufIcon: IconButton(
                onPressed: () {
                  addContr.add(AddScreenPinCheckClickedEvent());
                },
                icon: const Icon(Icons.done)),
            maximumLength: 6),
        Row(
          children: [
            Expanded(
                child: CommonWidgets.customTextField(
                    hint: "city",
                    isReadable: true,
                    contr: addContr.cityController)),
            Expanded(
                child: CommonWidgets.customTextField(
                    hint: "state",
                    isReadable: true,
                    contr: addContr.stateController)),
          ],
        ),
        const AddScreenSubmitButton(),
      ],
    );
  }
}
