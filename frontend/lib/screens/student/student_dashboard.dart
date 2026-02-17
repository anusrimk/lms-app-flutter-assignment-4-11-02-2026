import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/get_user_data_from_token.dart';
import '../../screens/login.dart';
import '../../models/user.dart';

class StudentDashboard extends StatefulWidget{
    StudentDashboardState createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard>{
    
    User? user;
    bool isLoading = true;

    void loadUserData() async{
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String token = sharedPreferences.getString('token');
        if(token == null){
            Navigator.pushNamed(context, '/login');
        }
        setState(() {
            user = getUserDataFromToken(token!);
            isLoading = false;
        });
    }

    void initState(){
        super.initState();
        loadUserData();
    }

    Widget build(BuildContext context){
        if(isLoading){
            return Scaffold(
                appBar: AppBar(
                    title: Text('Student Dashboard'),
                ),
                body: CircularProgressIndicator(),
            );
        }
        else{
            return Scaffold(
                appBar: AppBar(
                    title: Text('Student Dashboard'),
                ),
                body: Text('Welcome ${user!.name}')
            );
        }
    }
}