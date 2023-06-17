import 'dart:async';

import 'package:covid19_tracker/myHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5),
            () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyHome()))
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,),
            Expanded(child: Lottie.asset(
                'assets/covid19-sheild.json', height: 200, width: 400)),
            Text('COVID-19', style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            Text('Stay home be safe', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.systemGreen),),
            Lottie.asset('assets/loading.json', height: 150),
          ],
        ),
      ),
    );
  }
}