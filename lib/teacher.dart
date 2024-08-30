import 'package:flutter/material.dart';
import 'package:multiroleapp/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Techer Profile'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.remove('isLogin');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text('Logout')),
                ),
              ),
            )
        ],
      ),
      ),
    );
  }
}