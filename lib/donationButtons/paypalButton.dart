import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

///PayPal donate buttons
class PayPalButton extends StatelessWidget {
  ///The text to be displayed to the user
  final String donationText;

  ///The ID of your button
  final String paypalButtonId;

  ///If you want to change the color to maybe yellow, be aware of brand guidelines!
  final Color? color;

  ///function to call after opening the url
  final VoidCallback? onDonation;

  ///Optional custom styling
  final ButtonStyle? style;

  ///function to call when launch url
  final Future<bool> Function(String urlString)? onLaunchURL;

  const PayPalButton(
      {Key? key,
      this.donationText = "Donate with Paypal",
      required this.paypalButtonId,
      this.color,
      this.onDonation,
      this.style,
      this.onLaunchURL})
      : super(key: key);

  ///Paypal base url for donations
  final String baseUrl = "https://www.paypal.com/donate?hosted_button_id=";
  @override
  Widget build(BuildContext context) {
    assert(paypalButtonId.isNotEmpty);
    return Container(
      child: ElevatedButton.icon(
          label: Text(this.donationText),
          icon: Icon(SimpleIcons.paypal),
          style: style == null
              ? ElevatedButton.styleFrom(
                  backgroundColor: color ?? Colors.blue[600])
              : ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(color ?? Colors.blue[600]))
                  .merge(style),
          onPressed: () async {
            try {
              await (onLaunchURL != null
                  ? onLaunchURL!(baseUrl + paypalButtonId)
                  : launchUrlString(baseUrl + paypalButtonId));
            } catch (e) {
              print("Error: $e");
            }
            if (onDonation != null) {
              onDonation!();
            }
          }),
    );
  }
}
