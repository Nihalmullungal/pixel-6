import 'package:customer_app/application/homescreen_bloc/homescreen_bloc.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_state.dart';
import 'package:customer_app/presentation/constants/font_theme.dart';
import 'package:customer_app/presentation/screens/home_screen/sub_widgts/home_screen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenList extends StatelessWidget {
  const HomeScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        final homeContr = context.watch<HomeScreenBloc>();
        return homeContr.allCustomer.isEmpty
            ? const Text(
                "No Data Found !!!",
                style: FontTheme.homeTextStyle,
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return HomeScreenCard(customer: homeContr.allCustomer[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: homeContr.allCustomer.length);
      },
      listener: (context, state) {},
    );
  }
}
