import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/presentation/screens/add_screen/add_screen.dart';
import 'package:customer_app/presentation/screens/home_screen/sub_widgts/home_screen_list.dart';
import 'package:customer_app/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.customAppBar(title: "Home"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AddScreenBloc>(context).clearAllController();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: HomeScreenList(),
      ),
    );
  }
}
