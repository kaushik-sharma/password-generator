import 'dart:async';

import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/utils/color_palette.dart';
import 'package:provider/provider.dart';

class GeneratedPasswordCard extends StatefulWidget {
  const GeneratedPasswordCard({Key? key}) : super(key: key);

  @override
  State<GeneratedPasswordCard> createState() => _GeneratedPasswordCardState();
}

class _GeneratedPasswordCardState extends State<GeneratedPasswordCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.addListener(
      () {
        if (_controller.isCompleted) {
          Timer(
            const Duration(seconds: 1),
            () => _controller.reverse(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(
      ClipboardData(
        text: Provider.of<PasswordModel>(context, listen: false).password,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      color: kBackgroundColor2,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<PasswordModel>(
            builder: (context, passwordModel, child) => Text(
              passwordModel.password,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedIconButton(
            animationController: _controller,
            onPressed: _copyToClipboard,
            icons: const [
              AnimatedIconItem(
                icon: Icon(
                  FontAwesomeIcons.copy,
                  color: kPrimaryColor,
                ),
              ),
              AnimatedIconItem(
                icon: Icon(
                  FontAwesomeIcons.check,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
