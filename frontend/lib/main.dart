import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'screens/librarian/librarian_dashboard.dart';
import 'screens/student/student_dashboard.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'LMS',
            initialRoute: '/',
            routes: {
                '/': (context) => RegisterScreen(),
                '/login': (context) => LoginScreen(),
                '/librarian_dashboard': (context) => LibrarianDashboard(),
                '/student_dashboard': (context) => StudentDashboard(),
            },
        );
    }
}