import 'package:flutter/material.dart';
import 'package:password_generator/pages/home/components/generate_password_button.dart';
import 'package:password_generator/pages/home/components/generated_password_card.dart';
import 'package:password_generator/pages/home/components/meta_info.dart';
import 'package:password_generator/pages/home/components/password_length.dart';
import 'package:password_generator/pages/home/components/password_length_slider.dart';
import 'package:password_generator/pages/home/components/password_preference_menu.dart';
import 'package:password_generator/pages/home/components/password_strength_card.dart';
import 'package:password_generator/utils/color_palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Password Generator',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const GeneratedPasswordCard(),
                const SizedBox(height: 20.0),
                Container(
                  width: 450.0,
                  color: kBackgroundColor2,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      PasswordLength(),
                      SizedBox(height: 20.0),
                      PasswordLengthSlider(),
                      SizedBox(height: 20.0),
                      PasswordPreferenceMenu(),
                      SizedBox(height: 20.0),
                      PasswordStrengthCard(),
                      SizedBox(height: 20.0),
                      GeneratePasswordButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 10.0,
            bottom: 10.0,
            child: MetaInfo(),
          ),
        ],
      ),
    );
  }
}
