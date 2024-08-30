import 'package:flutter/material.dart';
import 'package:multiroleapp/home_screen.dart';
import 'package:multiroleapp/student.dart';
import 'package:multiroleapp/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  var _value;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Value is:${_value}'),
             Center(child: Icon(Icons.home),),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Age',
                ),
              ),
              SizedBox(height: 20,),
              PopupMenuButton(
                position: PopupMenuPosition.under,
                offset: Offset(1, 0),
                onSelected: (value){
                  setState(() {
                    _value = value;
                  });
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select your type of Account"),
                    Icon(Icons.select_all_outlined)
                  ],
                ),
                itemBuilder:(context) => [
                const PopupMenuItem(
                  value: 'Student',
                  child:Text('Student',)
                ),
                 const PopupMenuItem(
                  value: 'Teacher',
                  child:Text('Teacher') 
                ),
                 const PopupMenuItem(
                  value: 'Admin',
                  child:Text('Admin') 
                )
              ],),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: ()async{
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setString('email',emailController.toString());
                    sp.setString('age', ageController.toString());
                    sp.setBool('isLogin', true);
                    sp.setString('userType', _value.toString());
                   
                    if(_value == 'Student'){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Student()));
                    }else if(_value == 'Teacher'){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Teacher()));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(child: Text('Login')),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}