import 'package:customer_app/presentation/screens/add_screen/sub_widgets/add_screen_all_widgets.dart';
import 'package:customer_app/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.customAppBar(title: "Add Screen"),
      body: const AddScreenAllWidgets(),
    );
  }
}
