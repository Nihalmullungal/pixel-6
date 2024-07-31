import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/application/addscreen_bloc/addscreen_event.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_bloc.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_event.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_state.dart';
import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:customer_app/presentation/screens/edit_screen/edit_screen.dart';
import 'package:customer_app/presentation/screens/home_screen/sub_widgts/home_screen_card_first_row.dart';
import 'package:customer_app/presentation/screens/home_screen/sub_widgts/home_screen_card_second_row.dart';
import 'package:customer_app/presentation/screens/home_screen/sub_widgts/home_screen_card_third_row.dart';
import 'package:customer_app/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({super.key, required this.customer});
  final CustomerModal customer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if (state is HomeScreenDeleteDoneState) {
          CommonWidgets.customSnackBar(
              ctx: context, message: "Deleted SuccessFully", isSuccess: false);
        } else if (state is HomeEditClickedState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const EditScreen(),
          ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 20,
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AddScreenBloc>(context).add(
                                  EditScreenClickedEvent(
                                      customer: customer, ctx: context));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<HomeScreenBloc>(context).add(
                                  HomeScreenDeleteClickedEvent(
                                      customer: customer));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    HomeScreenCardFirstRow(customer: customer),
                    HomeScreenCardSecondRow(customer: customer),
                    HomeScreenCardThirdRow(customer: customer)
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
