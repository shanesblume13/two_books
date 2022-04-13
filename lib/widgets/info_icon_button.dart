import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoIconButton extends StatelessWidget {
  const InfoIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info),
      onPressed: () {
        showAboutDialog(
          context: context,
          applicationIcon: const CircleAvatar(
            radius: 20,
            child: Icon(
              Icons.book,
              size: 20,
            ),
          ),
          applicationName: 'Two Books',
          applicationVersion: '1.0.0',
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              // child: Text('View the source code and README on Github.')),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'View the source code and README on ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Github',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://github.com/shanesblume13/two_books');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
