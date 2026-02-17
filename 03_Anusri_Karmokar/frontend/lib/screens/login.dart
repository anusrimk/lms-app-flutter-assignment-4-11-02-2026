import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../utils/custom_alert_box.dart';
import 'dart:async';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
    LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
    
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    void handleLogin() async {
        final response = await UserService.login(usernameController.text, passwordController.text);
        // print(response);

        if(response['message'] == 'Login successful'){
            String token = response['token'];
            SharedPreferences SharedPreferencess = await SharedPreferences.getInstance();
            SharedPreferences.setString('token', token);
            User user = getUserDataFromToken(token!);
            CustomAlertBox.showSuccess(context, 'Success', response['message']);
            Timer(Duration(seconds:2), () => {
                if(user != null){
                    if(user.userType == 'LIBRARIAN'){
                        Navigator.pushNamed(context, '/librarian_dashboard');
                    }
                    else if(user.userType == 'STUDENT'){
                        Navigator.pushNamed(context, '/student_dashboard');
                    }
                }
            })
            
        }else{
            CustomAlertBox.showError(context, 'Error', response['message']);
        }

    }

    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text('Login'),
            ),
            body: Column(
                children: [
                    Text('Login'),
                    TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            helperText: 'Enter your username',
                        ),
                    ),
                    TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            helperText: 'Enter your password',
                        ),
                    ),
                    ElevatedButton(
                        child: Text('Login'),
                        onPressed: handleLogin,
                    ),
                ]
            ),
        );
    }
}