import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/utils/color_palette.dart';
import 'package:provider/provider.dart';

class GeneratePasswordButton extends StatefulWidget {
  const GeneratePasswordButton({super.key});

  @override
  State<GeneratePasswordButton> createState() => _GeneratePasswordButtonState();
}

class _GeneratePasswordButtonState extends State<GeneratePasswordButton> {
  late final PasswordModel _passwordModel;
  var _isHovered = false;

  @override
  void initState() {
    super.initState();
    _passwordModel = Provider.of<PasswordModel>(context, listen: false);
  }

  int _countSelectedPrefs() {
    var count = 0;
    if (_passwordModel.includeUppercaseLetters) {
      count++;
    }
    if (_passwordModel.includeLowercaseLetters) {
      count++;
    }
    if (_passwordModel.includeNumbers) {
      count++;
    }
    if (_passwordModel.includeSymbols) {
      count++;
    }
    return count;
  }

  void _generatePassword() {
    if (_countSelectedPrefs() < 2) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Include at least two preference options.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          padding: EdgeInsets.all(20.0),
          width: 400.0,
        ),
      );
      return;
    }
    _passwordModel.generatePassword();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _generatePassword,
      onHover: (value) {
        _isHovered = value;
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0.0),
        backgroundColor: _isHovered ? kBackgroundColor2 : kPrimaryColor,
        foregroundColor: _isHovered ? kPrimaryColor : kBackgroundColor1,
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          side: _isHovered
              ? const BorderSide(
                  color: kPrimaryColor,
                  width: 2.0,
                )
              : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Generate'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20.0),
          const Icon(
            FontAwesomeIcons.arrowRight,
            size: 12.0,
          ),
        ],
      ),
    );
  }
}
