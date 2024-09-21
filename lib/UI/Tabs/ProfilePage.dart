import 'package:e_commerce/UI/Login_Screen.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String fullName = '';
  String email = '';
  String mobile = '';

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email.isNotEmpty ? email : 'route@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, LoginScreen.routName);
                    },
                    icon: Icon(Icons.logout_outlined),
                  ),
                ],
              ),
              SizedBox(height: 32),
              buildProfileField('Your full name', 'abelrhmanHany'),
              buildProfileField('Your E-mail', 'abelrhmanHany@gmail.com'),
              buildProfileField('Your password', '123456', obscureText: true),
              buildProfileField('Your mobile number', '***********'),
              buildProfileField('Your Address', 'alexandria-egypt'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileField(String label, String value, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          obscureText: obscureText,
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 16), // Adds space between fields
      ],
    );
  }
}
