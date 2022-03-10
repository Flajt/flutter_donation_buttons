import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///Colors to choose from
enum BuyMeACoffeColor { Yellow, Orange, Violet, Blue, Green }

class BuyMeACoffeButton extends StatelessWidget {
  ///Text to display
  final String text;

  ///One of the [BuyMeACoffeColor] colors, to color your button with
  final BuyMeACoffeColor color;

  ///Your buymeacoffe.com name e.g. flajt
  final String buyMeACoffeName;

  ///fonction to call after opening the url
  final VoidCallback? onDonation;
  const BuyMeACoffeButton(
      {Key? key,
      this.text = "Buy me a Coffe",
      this.color = BuyMeACoffeColor.Yellow,
      required this.buyMeACoffeName,
      this.onDonation})
      : super(key: key);
  final String baseUrl = "https://www.buymeacoffee.com/";
  @override
  Widget build(BuildContext context) {
    Map<String, Color> _colors = {
      "BuyMeACoffeColor.Yellow": Color(0xffffdd00),
      "BuyMeACoffeColor.Orange": Color(0xffff5f5f),
      "BuyMeACoffeColor.Violet": Color(0xffbd5fff),
      "BuyMeACoffeColor.Blue": Color(0xff5f7fff),
      "BuyMeACoffeColor.Green": Color(0xff40dca5)
    };

    return ElevatedButton(
      onPressed: () {
        try {
          launch(baseUrl + buyMeACoffeName);
        } catch (e) {
          print("Error: $e");
        }
        if (onDonation != null) {
          onDonation!();
        }
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        color != BuyMeACoffeColor.Yellow
            ? Image.asset("assets/coffe.png",
                package: "flutter_donation_buttons", width: 30, height: 30)
            : Image.asset("assets/coffe2.png",
                package: "flutter_donation_buttons", width: 30, height: 30),
        Text(
          text,
          style: TextStyle(
              color: color != BuyMeACoffeColor.Yellow
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ]),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(100, 20),
          fixedSize: Size(200, 42),
          primary: _colors[color.toString()]),
    );
  }
}
