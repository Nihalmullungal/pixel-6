import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/application/addscreen_bloc/addscreen_state.dart';
import 'package:customer_app/presentation/screens/add_screen/sub_widgets/add_screen_text_fields.dart';
import 'package:customer_app/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenAllWidgets extends StatelessWidget {
  const AddScreenAllWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddScreenBloc, AddScreenState>(
      listener: (context, state) {
        if (state is AddScreenPanErrorState) {
          CommonWidgets.customSnackBar(
              ctx: context,
              message: "Enter a valid Pan Number",
              isSuccess: false);
        } else if (state is AddScreenNameErrorState) {
          CommonWidgets.customSnackBar(
              ctx: context, message: "Enter a valid Name", isSuccess: false);
        } else if (state is AddScreenEmailErrorState) {
          CommonWidgets.customSnackBar(
              ctx: context, message: "Enter a valid Email", isSuccess: false);
        } else if (state is AddScreenMobileErrorState) {
          CommonWidgets.customSnackBar(
              ctx: context,
              message: "Enter a valid Mobile Number",
              isSuccess: false);
        } else if (state is AddScreenAddressErrorState) {
          CommonWidgets.customSnackBar(
              ctx: context, message: "Enter a valid Address", isSuccess: false);
        } else if (state is AddScreenPinErrorkState) {
          CommonWidgets.customSnackBar(
              ctx: context,
              message: "Enter a valid Post Code ",
              isSuccess: false);
        } else if (state is AddScreenCustomerAddedState) {
          CommonWidgets.customSnackBar(
              ctx: context,
              message: "Customer Added Successfully",
              isSuccess: true);
          Navigator.of(context).pop();
        } else if (state is EditCustomerSuccessState) {
          CommonWidgets.customSnackBar(
              ctx: context,
              message: "Customer updated Successfully",
              isSuccess: true);
          Navigator.of(context).pop();
        }
      },
      child: const AddScreenTextFields(),
    );
  }
}
