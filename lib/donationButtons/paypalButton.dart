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
  const PayPalButton(
      {Key? key,
      this.donationText = "Donate with Paypal",
      required this.paypalButtonId,
      this.color,
      this.onDonation})
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
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.blue[600]),
          onPressed: () {
            try {
              launchUrlString(baseUrl + paypalButtonId);
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
