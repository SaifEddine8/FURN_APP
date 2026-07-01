import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("1",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                 
               
                  
                },
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  
                    
                 
                  
                },
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}