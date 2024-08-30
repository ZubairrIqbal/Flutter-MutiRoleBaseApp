import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiroleapp/home_screen.dart';
import 'package:multiroleapp/loginscreen.dart';
import 'package:multiroleapp/student.dart';
import 'package:multiroleapp/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
    
  }

  void isLogin()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if(isLogin){
    //    Timer(Duration(seconds: 3), (){
    //   Navigator.push(context, 
    //   MaterialPageRoute(builder: (context)=>const HomeScreen())
    //   );
    // });

      if(userType == 'Student'){
        Timer(Duration(seconds: 3), (){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>const Student())
      );
    });
      }
      else if(userType == 'Teacher'){
        Timer(Duration(seconds: 3), (){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>const Teacher())
      );
    });
      }
    }else{
      Timer(Duration(seconds: 3), (){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>const LoginScreen())
      );
    });
     }
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
          'https://images.pexels.com/photos/27244532/pexels-photo-27244532/free-photo-of-alaskan-kenai-river.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
          )),
      ),
    );
  }
}