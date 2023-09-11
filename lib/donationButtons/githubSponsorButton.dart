import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GithubSponsorButton extends StatelessWidget {
  ///Text to display
  final String text;

  ///Your github.com name e.g. flajt
  final String githubUserName;

  ///function to call after opening the url
  final VoidCallback? onDonation;

  ///function to call when launch url
  final Future<bool> Function(String urlString)? onLaunchURL;

  ///Optional custom styling
  final ButtonStyle? style;

  ///If [isEnabled] == false, onPressed will not work and background color will be grey (BuyMeACoffeeColor.Grey)
  final bool isEnabled;

  const GithubSponsorButton({
    Key? key,
    this.text = "Sponsor",
    required this.githubUserName,
    this.onDonation,
    this.style,
    this.onLaunchURL,
    this.isEnabled = true,
  }) : super(key: key);
  final String baseUrl = "https://github.com/sponsors/";
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      icon: Icon(
        CupertinoIcons.heart,
        color: Color(0xffbf3a89),
      ),
      onPressed: !isEnabled
          ? null
          : () async {
              try {
                await (onLaunchURL != null
                    ? onLaunchURL!(baseUrl + githubUserName)
                    : launchUrlString(baseUrl + githubUserName));
              } catch (e) {
                debugPrint("Error: $e");
              }
              if (onDonation != null) {
                onDonation!();
              }
            },
      style: style == null
          ? ElevatedButton.styleFrom(
              minimumSize: Size(100, 20),
              fixedSize: Size(150, 42),
              backgroundColor: isEnabled ? Colors.white : Colors.grey)
          : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(
                      isEnabled ? Colors.white : Colors.grey))
              .merge(style),
    );
  }
}
