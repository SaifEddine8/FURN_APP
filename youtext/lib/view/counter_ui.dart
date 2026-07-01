import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtext/model/class_mocdel.dart';

class CounterUI extends StatelessWidget {
  const CounterUI({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${Provider.of<ClassMocdel>(context).counter}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                 
               Provider.of<ClassMocdel>(context,listen: false).decrement();
                  
                },
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ClassMocdel>(context,listen: false).increment();
               
                 
                  
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