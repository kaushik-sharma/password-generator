import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_generator/pages/home/components/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class MetaInfo extends StatelessWidget {
  const MetaInfo({super.key});

  void launchGithubLink(VoidCallback errorCallback) async {
    final uri = Uri.parse('');
    if (!(await url_launcher.canLaunchUrl(uri))) {
      errorCallback();
      return;
    }
    await url_launcher.launchUrl(uri);
  }

  void Function() showErrorMessage(BuildContext context) {
    return () => buildSnackBar(
          context: context,
          message: 'Failed to launch URL. Please retry.',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: () => launchGithubLink(
            showErrorMessage(context),
          ),
          icon: const Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
          ),
          label: Text(
            'Source code',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Text(
          'Version 1.0.0',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
