import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/utils/color_palette.dart';
import 'package:provider/provider.dart';

class PasswordLength extends StatelessWidget {
  const PasswordLength({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Character Length',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        Consumer<PasswordModel>(
          builder: (context, passwordModel, child) => Text(
            passwordModel.requiredLength.toString(),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
