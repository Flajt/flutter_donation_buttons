import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

///The 4 Offical Kofi Button Colors
enum KofiColor { Blue, Black, Orange, Red }

///A button to use if you link to Ko-fi
class KofiButton extends StatelessWidget {
  ///Display this text on the button default: Support me on Ko-fi
  final String text;

  ///On of the 4 [KofiColor]s
  final KofiColor kofiColor;

  ///Name of your account on kofi in lowercase, you can get it if you visit your page.
  ///How does a name look like: flajt , how does the full url look like? https://ko-fi.com/flajt <- this part after the / is your account name
  final String kofiName;

  ///function to call after opening the url
  final VoidCallback? onDonation;
  const KofiButton(
      {Key? key,
      this.text = "Support me on Ko-fi",
      required this.kofiName,
      this.kofiColor = KofiColor.Blue,
      this.onDonation})
      : super(key: key);

  ///Base Url: https://ko-fi.com/ <- your account name will be appended to its
  final String baseUrl = "https://ko-fi.com/";

  @override
  Widget build(BuildContext context) {
    assert(kofiName.isNotEmpty);
    final Map<String, Color> _colors = {
      "KofiColor.Blue": Color(0xff29ABE0),
      "KofiColor.Red": Color(0xffFF5E5B),
      "KofiColor.Orange": Color(0xffFBAA19),
      "KofiColor.Black": Color(0xff434B57)
    };
    return ElevatedButton.icon(
      onPressed: () {
        try {
          launch(baseUrl + kofiName);
        } catch (e) {
          print("Error: $e");
        }
        if (onDonation != null) {
          onDonation!();
        }
      },
      icon: Icon(SimpleIcons.kofi),
      label: Text(text),
      style: ElevatedButton.styleFrom(primary: _colors[kofiColor.toString()]),
    );
  }
}
