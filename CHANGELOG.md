## 0.0.1
Added Kofi, PayPal and Patreon Button

## 0.0.2
Fixed some small staff in the documentation, tried to format the data better

## 0.0.3
- Added example folder and main.dart
- Added [Buy me a coffe](https://www.buymeacoffee.com) button
- Added images

## 0.0.4
- Added `onDonation` optional callback to allow additional logic to run after a user donated something based on: [PR #1](https://github.com/Flajt/flutter_donation_buttons/pull/1). Thanks a lot to [@hatch01](https://github.com/hatch01)
- Updated example code with onDonation example
- Removed FontAwesome Icons as SimpleIcons already covered all icons to improve package size
- Added code so everyone can easily run the example

## 0.0.5
- Upgrade dependencies to be up to date
- Upgrade dart sdk version
- Upgrade flutter sdk version
- Changed `launch` to `launchUrlString`

## 0.0.6
- Fixed misspelled Coffee in files and strings. See [PR #2](https://github.com/Flajt/flutter_donation_buttons/pull/2). Thanks a lot to [@Haedong-Jeon](https://github.com/Haedong-Jeon) for opening that issue and (@MrCsabaToth)[https://github.com/MrCsabaToth] for resolving it.
- Switch print to debugPrint
- Add lint: don't use print
- Remove unused imports
- Remove depreciated APIs + flutter format

## 0.1.6
- Attempt to use semantic versioning correctly
- Allow custom styling while keeping button colors with new `style`. Thanks to [@collodi](https://github.com/collodi) for opening the issue.
- Update example to reflect new feature

## 0.2.6
- Created new parameter called onDonate which allows for custom code to be executed instead of the typical url launcher method. Thanks to [@FriesI23](https://github.com/FriesI23)
- Add pubspec.lock to .gitignore based on [this](https://stackoverflow.com/a/16136740) StackOverflow post

## 0.2.7
- Replace print with `debugPrint` in `try catch` statements

## 0.3.7
- Add `isEnabled` property to disable or enable Ko-fi and BuyMeACoffeButton. Thanks to [@maxmitchenko](https://github.com/maxmitchenko) for this feature

## 0.4.7
- Add Github Sponsor Button. Thanks for the suggestion to: [@bettysteger ](https://github.com/bettysteger)

## 0.4.8
- Add `githubSponsorButton` to barrel file

## 0.4.10
- Upgrade sdk range
- Upgrade packages
- Fix spelling in README thanks to [@ilovelinux](https://github.com/ilovelinux/)