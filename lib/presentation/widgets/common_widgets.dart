import 'package:customer_app/presentation/constants/font_theme.dart';
import 'package:customer_app/presentation/constants/app_theme.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  static Padding customTextField({
    required String hint,
    TextInputType? keyboardType,
    bool isReadable = false,
    TextEditingController? contr,
    Widget? sufIcon,
    int? maximumLength,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: FontTheme.textFieldTextStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            keyboardType: keyboardType,
            maxLength: maximumLength,
            controller: contr,
            readOnly: isReadable,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter a valid $hint";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: sufIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static AppBar customAppBar({required String title}) {
    return AppBar(
      backgroundColor: ThemeOfApp.themeOfAppBar,
      centerTitle: true,
      iconTheme: ThemeOfApp.themeOfAppBarIcon,
      title: Text(
        title,
        style: FontTheme.appBarStyle,
      ),
    );
  }

  static dynamic customSnackBar(
      {required BuildContext ctx,
      required String message,
      required bool isSuccess}) {
    return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    ));
  }
}
