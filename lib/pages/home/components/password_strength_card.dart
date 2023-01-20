import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/utils/color_palette.dart';
import 'package:provider/provider.dart';

class PasswordStrengthCard extends StatelessWidget {
  const PasswordStrengthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor1,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Strength'.toUpperCase(),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          const _StrengthIndicator(),
        ],
      ),
    );
  }
}

class _StrengthIndicator extends StatelessWidget {
  const _StrengthIndicator();

  Map<String, dynamic> getStrengthData(double entropy) {
    final data = {
      'text': '',
      'color': Colors.transparent,
      'activeBars': 0,
      'inactiveBars': 0,
    };

    if (entropy == 0.0) {
      return data;
    }

    if (entropy < 40.0) {
      data['text'] = 'Frail';
      data['color'] = Colors.red;
      data['activeBars'] = 1;
      data['inactiveBars'] = 3;
    } else if (entropy < 70.0) {
      data['text'] = 'Fair';
      data['color'] = Colors.orange;
      data['activeBars'] = 2;
      data['inactiveBars'] = 2;
    } else if (entropy < 100.0) {
      data['text'] = 'Medium';
      data['color'] = Colors.teal;
      data['activeBars'] = 3;
      data['inactiveBars'] = 1;
    } else {
      data['text'] = 'Strong';
      data['color'] = kPrimaryColor;
      data['activeBars'] = 4;
      data['inactiveBars'] = 0;
    }

    return data;
  }

  Widget buildStrengthBars(int count, Widget item) {
    return SizedBox(
      height: 25.0,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) => item,
        separatorBuilder: (context, index) => const SizedBox(width: 4.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordModel>(
      builder: (context, passwordModel, child) {
        final data = getStrengthData(passwordModel.entropy);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (data['text'] as String).toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10.0),
            buildStrengthBars(
              data['activeBars'] as int,
              _StrengthBar(
                color: data['color'] as Color,
                isActive: true,
              ),
            ),
            const SizedBox(width: 4.0),
            buildStrengthBars(
              data['inactiveBars'] as int,
              const _StrengthBar(
                color: Colors.transparent,
                isActive: false,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StrengthBar extends StatelessWidget {
  const _StrengthBar({
    required this.color,
    required this.isActive,
  });

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.0,
      decoration: BoxDecoration(
        color: isActive ? color : Colors.transparent,
        border: isActive ? const Border() : Border.all(color: Colors.white),
      ),
    );
  }
}
