import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/screen/bottom_nav_bar.dart';
import 'package:youtext/screen/on_boarding_screen.dart';
import 'package:youtext/screen/test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds:3),()=>
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>BottomNavBar())
      )

    );
    
    }
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.primaryColor,
      body:
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 30,
          children: [
            Icon(Icons.chair,color: Colors.white,size: 150,),
            CircularProgressIndicator(
              color: Colors.white,
            )
        
          ],
        ),
      )
    );
  }
}