import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:customer_app/presentation/constants/font_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCardThirdRow extends StatelessWidget {
  const HomeScreenCardThirdRow({super.key, required this.customer});
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
                "phone",
                style: FontTheme.homeScreentitleStyle,
              ),
              Text(
                "+91 ${customer.mobile}",
                style: FontTheme.homeScreenTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
