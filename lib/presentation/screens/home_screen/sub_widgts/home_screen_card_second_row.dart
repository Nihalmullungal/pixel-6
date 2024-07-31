import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:customer_app/presentation/constants/font_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCardSecondRow extends StatelessWidget {
  const HomeScreenCardSecondRow({super.key, required this.customer});
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
                "Pan Number",
                style: FontTheme.homeScreentitleStyle,
              ),
              Text(
                customer.panNumber,
                style: FontTheme.homeScreenTextStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Address",
                style: FontTheme.homeScreentitleStyle,
              ),
              Text(
                "${customer.address1} ${customer.address2}, ${customer.city}, ${customer.state}, ${customer.pinCode}",
                style: FontTheme.homeScreenTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
