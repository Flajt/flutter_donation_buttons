import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

///Patreon support button
class PatreonButton extends StatelessWidget {
  ///Text the button shows, default: "Support me on Patreon"
  final String text;

  ///Your patreon name e.g. buttonshy
  ///How to get it?
  ///visit your patreon page: https://patreon.com/buttonshy <- part after the / is your name
  final String patreonName;

  ///function to call after opening the url
  final VoidCallback? onDonation;

  ///Optional custom styling, allows full customization incl. Color
  final ButtonStyle? style;

  ///function to call when launch url
  final Future<bool> Function(String urlString)? onLaunchURL;

  const PatreonButton(
      {Key? key,
      this.text = "Support me on Patreon",
      required this.patreonName,
      this.onDonation,
      this.style,
      this.onLaunchURL})
      : super(key: key);

  ///Patreon base url
  final String baseUrl = "https://patreon.com/";
  @override
  Widget build(BuildContext context) {
    assert(patreonName.isNotEmpty);
    return ElevatedButton.icon(
        onPressed: () async {
          try {
            await (onLaunchURL != null
                ? onLaunchURL!(baseUrl + patreonName)
                : launchUrlString(baseUrl + patreonName));
          } catch (e) {
            print("Error: $e");
          }
          if (onDonation != null) {
            onDonation!();
          }
        },
        icon: Icon(
          SimpleIcons.patreon,
          color: Colors.black,
        ),
        label: Text(text),
        style: style == null
            ? ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange)
            : style);
  }
}
