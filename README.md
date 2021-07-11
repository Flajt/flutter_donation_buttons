# flutter_donation_buttons

Donation/Support buttons to allow you to add your favorite support buttons like: Paypal, Ko-fi or Patreon and more.

![screenshot](https://github.com/flajt/flutter_donation_buttons/screenshots/screenshot.jpg)
## Getting Started

`import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';`

As we are dependent on the *url_launcher* library you need to setup a bit of stuff first.
(I copied the setup instructions straight from the [url_launcher](https://pub.dev/packages/url_launcher) setup instructions)
### IOS:

Add any URL schemes passed to canLaunch as LSApplicationQueriesSchemes entries in your Info.plist file.

Example:
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
```
### Anroid:
Notice, I don't use the `canLaunch` as it sometimes returned false, but could still launch the url if tested.
I also removed the snippets for tel, email etc. as this packge shouldn't need them. 

Starting from API 30 Android requires package visibility configuration in your AndroidManifest.xml otherwise canLaunch will return false. 
A `<queries>` element must be added to your manifest as a child of the root element.

The snippet below shows an example for an application that uses https URLs with url_launcher. See the [Android documentation](https://developer.android.com/training/package-visibility/use-cases) for examples of other queries.
```xml
<queries>
  <!-- If your app opens https URLs -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```
### Use it:

After you added the most recent version of this plugin to your *pubspec.yaml* file, you can start using it, by importing your desired button and add the required data. Which is mostly your name/id for this service which will be appended to the baseUrl.

Each button allows to change the text of the button if you like.
Kofi comes with 4 colors (taken from the offical brand site)

### Example:

```dart

import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Donation Buttons Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
            KofiButton(kofiName: "flajt",kofiColor: KofiColor.Red,),
            PayPalButton(paypalButtonId: "T6NT2YYTVX6VS"),
            PatreonButton(patreonName: "buttonshy") // Just someone I stumbled accross on Patreon as an example, not affiliaited with him
          ],
        ),
      ),
    );
  }
}

```

### Supported Buttons:
 - Kofi (4 Colors)
 - PayPal (Custom Colors)
 - Patreon (Default orange)
 - Buy Me A Coffe (5 Colors)

### Need a different button? Or a Feature?
Simply open a new issue on Github with your desired button and a link to their website, and I will try to add it asap.

### Like what you see?
If you want to donate some bucks, feel free to do so.
<br>
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J25543M)