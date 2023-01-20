import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/utils/color_palette.dart';
import 'package:provider/provider.dart';

class PasswordPreferenceMenu extends StatelessWidget {
  const PasswordPreferenceMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<PasswordModel>(
          builder: (context, passwordModel, child) => _MyCheckboxTile(
            value: passwordModel.includeUppercaseLetters,
            title: 'Include Uppercase Letters',
            onTap: passwordModel.flipIncludeUppercaseLetters,
          ),
        ),
        const SizedBox(height: 10.0),
        Consumer<PasswordModel>(
          builder: (context, passwordModel, child) => _MyCheckboxTile(
            value: passwordModel.includeLowercaseLetters,
            title: 'Include Lowercase Letters',
            onTap: passwordModel.flipIncludeLowercaseLetters,
          ),
        ),
        const SizedBox(height: 10.0),
        Consumer<PasswordModel>(
          builder: (context, passwordModel, child) => _MyCheckboxTile(
            value: passwordModel.includeNumbers,
            title: 'Include Numbers',
            onTap: passwordModel.flipIncludeNumbers,
          ),
        ),
        const SizedBox(height: 10.0),
        Consumer<PasswordModel>(
          builder: (context, passwordModel, child) => _MyCheckboxTile(
            value: passwordModel.includeSymbols,
            title: 'Include Symbols',
            onTap: passwordModel.flipIncludeSymbols,
          ),
        ),
      ],
    );
  }
}

class _MyCheckboxTile extends StatefulWidget {
  const _MyCheckboxTile({
    required this.value,
    required this.title,
    required this.onTap,
  });

  final bool value;
  final String title;
  final VoidCallback onTap;

  @override
  State<_MyCheckboxTile> createState() => _MyCheckboxTileState();
}

class _MyCheckboxTileState extends State<_MyCheckboxTile> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                _isHovered = value;
                setState(() {});
              },
              child: Checkbox(
                fillColor: MaterialStateProperty.all<Color>(
                  widget.value || _isHovered ? kPrimaryColor : Colors.white,
                ),
                value: widget.value,
                onChanged: (_) => widget.onTap(),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
