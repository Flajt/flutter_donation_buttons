import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Donation Buttons Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            KofiButton(
              kofiName: "flajt",
              kofiColor: KofiColor.Red,
              onDonation: () {
                print("On donation"); // Runs after the button has been pressed
              },
            ),
            const PayPalButton(paypalButtonId: "T6NT2YYTVX6VS"),
            const PatreonButton(patreonName: "buttonshy"),
            const BuyMeACoffeeButton(
              buyMeACoffeeName: "flajt",
              color: BuyMeACoffeeColor.Green,
            ), // Just someone I stumbled across on Patreon as an example, not affiliated with him
          ],
        ),
      ),
    );
  }
}
