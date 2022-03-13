import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/donationButtons/ko-fiButton.dart';
import 'package:flutter_donation_buttons/donationButtons/paypalButton.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            KofiButton(kofiName: "flajt"),
            PayPalButton(paypalButtonId: "T6NT2YYTVX6VS"),
            PatreonButton(patreonName: "buttonshy"),
          ],
        ),
      ),
    );
  }
}
