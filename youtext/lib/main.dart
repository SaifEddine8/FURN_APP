import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtext/counterApp/counter_screen.dart';
import 'package:youtext/model/class_mocdel.dart';
import 'package:youtext/screen/splash_screen.dart';
import 'package:youtext/view/counter_ui.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ClassMocdel(),
    child: MaterialApp(
    home:
    CounterUI()
    ),
  )
  );
}



/*

WARNING: Your Android app project: app located at: C:\Users\USER\Downloads\FURN_APP-main\FURN_APP-main\youtext\android\app\build.gradle.kts
applies the Kotlin Gradle Plugin, which will cause build failures in future versions of Flutter. 
Please migrate your app to Built-in Kotlin using this guide: https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers
2

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:configureCMakeDebug[x86_64]'.


> [CXX1429] error when building with cmake using C:\src\flutter\packages\flutter_tools\gradle\src\main\scripts\CMakeLists.txt: Not searching for unused variables given on the command line.
*/

