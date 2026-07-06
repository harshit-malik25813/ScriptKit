# Homework Formatter

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart\&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Windows](https://img.shields.io/badge/Windows-Untested-lightgrey?logo=windows)
![macOS](https://img.shields.io/badge/macOS-Tested-success?logo=apple)
![Android](https://img.shields.io/badge/Android-Tested-success?logo=android)

A simple Flutter application that formats school homework into a clean, shareable message.

Instead of manually typing homework every day, simply enter each subject's homework, generate the formatted output, and copy it to your clipboard with one click.

## Features

* 📚 Individual fields for:

  * Maths
  * Physics
  * Chemistry
  * Biology
  * SST
  * Hindi
  * English
  * Additional Details
* ✨ Automatically formats homework into a neat message.
* 📋 One-click copy to clipboard.
* 🗓 Automatically inserts the current date.
* 🎨 Clean Material 3 interface.

## Platform Support

| Platform |    Status   | Notes                                                         |
| -------- | :---------: | ------------------------------------------------------------- |
| Android  |   ✅ Tested  | Verified on Samsung devices running Android 15 and Android 16 |
| macOS    |   ✅ Tested  | Verified on Apple Silicon (M5 and M1 Pro)                     |
| Windows  | ⚠️ Untested | Expected to work, but has not yet been tested                 |

## Example Output

```text
*Homework*

*06-07-2026*

*Maths*: Complete Exercise 5.2

*Physics*: Learn Chapter 3

*Chemistry*: Write practical observations

*English*: Read pages 40–45

Bring your practical file tomorrow.
```

## How It Works

The app collects homework for each subject and generates a clean, formatted message. Empty subjects are automatically omitted, ensuring the output only contains homework that has been entered.

## Tech Stack

* Flutter
* Dart
* Material 3

## License

This project is licensed under the AGPL-3.0 License.
