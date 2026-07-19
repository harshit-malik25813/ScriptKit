# Homework Formatter

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart\&logoColor=white)
![License](https://img.shields.io/badge/License-AGPL_3.0-green)
![Windows](https://img.shields.io/badge/Windows-Untested-lightgrey?logo=windows)
![macOS](https://img.shields.io/badge/macOS-Tested-success?logo=apple)
![Android](https://img.shields.io/badge/Android-Tested-success?logo=android)

A simple Flutter application that formats school homework into a clean, shareable message.

Instead of manually typing homework every day, simply enter each subject's homework, generate the formatted output, and copy it to your clipboard with one click.

## Features

* Individual fields for:
	* Six Lectures, each containing:
		* 1 Classwork (CW) field
		* 1 Homework (HW) field
* Automatically formats homework into a neat message.
* One-click copy to clipboard.
* Automatically inserts the current date.
* Clean Material 3 interface.

## Platform Support

| Platform |    Status   | Notes                                                         |
| -------- | :---------: | ------------------------------------------------------------- |
| Android  |   ✅ Tested  | Verified on Samsung devices running Android 15 and Android 16 |
| macOS    |   ✅ Tested  | Verified on Apple Silicon (M5 and M1 Pro)                     |
| Windows  | ⚠️ Untested | Expected to work, but has not yet been tested                 |

## Example Output

```text
*_DAILY CLASSWORK & HOMEWORK UPDATE_*

*_CLASS- X / Ambition_*
*Date* : 10/07/2026

🔴 *LECTURE 1: Maths*
*Classwork* : Practice of Complimentary T-Ratios
*Homework* : solve given questions
🔵 *LECTURE 2: Hindi*
*Classwork* : Test Conducted
*Homework* : Test of UT-4 Syllabus to be held
🟢 *LECTURE 3: SST*
*Classwork* : Substitute Lecture
*Homework* : Learn GK assignment
🟡 *LECTURE 4: Chemistry*
*Classwork* : Carbon and its Compunds Explanation
*Homework* : Revise work done in class
🟠 *LECTURE 5: Physics*
*Classwork* : Doubts + Magnetic Flux
*Homework* : Prepare for test
🟣 *LECTURE 6: Maths*
*Classwork* : Trigonometry Advance
*Homework* : Do given questions
```

## How It Works

The app collects homework for each subject and generates a clean, formatted message. Empty subjects are automatically omitted, ensuring the output only contains homework that has been entered.

## Tech Stack

* Flutter
* Dart
* Material 3

## License

This project is licensed under the AGPL-3.0 License.
