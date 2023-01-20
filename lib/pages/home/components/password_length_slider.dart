import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:provider/provider.dart';

class PasswordLengthSlider extends StatelessWidget {
  const PasswordLengthSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordModel>(
      builder: (context, passwordModel, child) => Slider(
        min: 5.0,
        max: 20.0,
        value: passwordModel.requiredLength.toDouble(),
        onChanged: (newValue) =>
            passwordModel.requiredLength = newValue.toInt(),
      ),
    );
  }
}
