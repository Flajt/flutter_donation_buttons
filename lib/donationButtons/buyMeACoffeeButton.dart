import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

///Colors to choose from
enum BuyMeACoffeeColor { Yellow, Orange, Violet, Blue, Green }

class BuyMeACoffeeButton extends StatelessWidget {
  ///Text to display
  final String text;

  ///One of the [BuyMeACoffeeColor] colors, to color your button with
  final BuyMeACoffeeColor color;

  ///Your buymeacoffee.com name e.g. flajt
  final String buyMeACoffeeName;

  ///function to call after opening the url
  final VoidCallback? onDonation;

  ///function to call when launch url
  final Future<bool> Function(String urlString)? onLaunchURL;

  ///Optional custom styling
  final ButtonStyle? style;

  const BuyMeACoffeeButton(
      {Key? key,
      this.text = "Buy me a Coffee",
      this.color = BuyMeACoffeeColor.Yellow,
      required this.buyMeACoffeeName,
      this.onDonation,
      this.style,
      this.onLaunchURL})
      : super(key: key);
  final String baseUrl = "https://www.buymeacoffee.com/";
  @override
  Widget build(BuildContext context) {
    Map<String, Color> _colors = {
      "BuyMeACoffeeColor.Yellow": Color(0xffffdd00),
      "BuyMeACoffeeColor.Orange": Color(0xffff5f5f),
      "BuyMeACoffeeColor.Violet": Color(0xffbd5fff),
      "BuyMeACoffeeColor.Blue": Color(0xff5f7fff),
      "BuyMeACoffeeColor.Green": Color(0xff40dca5)
    };

    return ElevatedButton(
      onPressed: () async {
        try {
          await (onLaunchURL != null
              ? onLaunchURL!(baseUrl + buyMeACoffeeName)
              : launchUrlString(baseUrl + buyMeACoffeeName));
        } catch (e) {
          debugPrint("Error: $e");
        }
        if (onDonation != null) {
          onDonation!();
        }
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        color != BuyMeACoffeeColor.Yellow
            ? Image.asset("assets/coffee.png",
                package: "flutter_donation_buttons", width: 30, height: 30)
            : Image.asset("assets/coffee2.png",
                package: "flutter_donation_buttons", width: 30, height: 30),
        Text(
          text,
          style: TextStyle(
              color: color != BuyMeACoffeeColor.Yellow
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ]),
      style: style == null
          ? ElevatedButton.styleFrom(
              minimumSize: Size(100, 20),
              fixedSize: Size(200, 42),
              backgroundColor: _colors[color.toString()])
          : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(
                      _colors[color.toString()]))
              .merge(style),
    );
  }
}
