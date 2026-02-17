import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
    
    Widget build(BuildContext context){

        User user = ModalRoute.of(context)!.settings.arguments as User;
        return Scaffold(
            appBar: AppBar(
                title: Text('Profile'),
            ),
            body: Center(
                child: Text('Profile screen of ${user.name}'),
            ),
        );
    }
}