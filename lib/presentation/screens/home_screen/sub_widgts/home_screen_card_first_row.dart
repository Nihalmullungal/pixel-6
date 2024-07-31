import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:customer_app/presentation/constants/font_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCardFirstRow extends StatelessWidget {
  const HomeScreenCardFirstRow({super.key, required this.customer});
  final CustomerModal customer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: FontTheme.homeScreentitleStyle,
              ),
              Text(
                customer.fullName,
                style: FontTheme.homeScreenTextStyle,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: FontTheme.homeScreentitleStyle,
              ),
              Text(
                customer.email,
                style: FontTheme.homeScreenTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
