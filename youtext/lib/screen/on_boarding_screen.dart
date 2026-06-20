import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pagecontroller= PageController();
  bool islastpage=false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:
      Stack(
        children:[
           PageView(
            onPageChanged: (index) {
              setState(() {
                index==2?islastpage=true:islastpage=false;
              });
            },
            controller: pagecontroller,
          children: [
            Container(
              color: Colors.red,
              child: Center(child: Text("Page 1")),
        
            ),
            Container(
              color: Colors.green,
              child: Center(child: Text("Page 2")),
        
            ),
            Container(
              color: Colors.blue,
              child: Center(child: Text("Page 3")),
        
            )
          ],
        ),
        Container(
          alignment: Alignment(0, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  pagecontroller.jumpToPage(2);
                },
                child: Text('S k i p')),
              SmoothPageIndicator(controller: pagecontroller, count:3 ),
              InkWell(
                onTap: () {
                   pagecontroller.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
                },
                child: Text(islastpage?'D o n e':'N e x t')
              )
            ],
          ))
        ]
      )
    );
  }
}