import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuState extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Center(
              child: ElevatedButton(
                child: Text('button'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFC14949)),
                ),
              ),
            )
          ],
        ), 
      ),
    );
  }
}