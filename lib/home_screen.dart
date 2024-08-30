import 'package:flutter/material.dart';
import 'package:multiroleapp/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late String email ='', age='';
  void loadData()async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  email = sp.getString('email') ?? '';
  age = sp.getString('age') ?? '';
  setState(() {
    
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(email.toString()),
              ],
            ),
            Row(
              children: [
                Text('Age'),
                Text(age.toString())
              ],
            ),
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