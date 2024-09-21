import 'package:e_commerce/Data/SharedPreference_pacakge.dart';
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
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    fullName = await SharedpreferenceUtils.getData(key: "fullName") ?? '';
    email = await SharedpreferenceUtils.getData(key: "email") ?? '';
    mobile = await SharedpreferenceUtils.getData(key: "mobile") ?? '';
    setState(() {});
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
                        email.isNotEmpty ? email : 'your email.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      await SharedpreferenceUtils.deleteData(key: "token");
                      Navigator.pushReplacementNamed(context, LoginScreen.routName);
                    },
                    icon: Icon(Icons.logout_outlined),
                  ),
                ],
              ),
              SizedBox(height: 32),
              buildProfileField('Your full name', fullName),
              buildProfileField('Your E-mail', email),
              buildProfileField('Your password', '', obscureText: true),
              buildProfileField('Your mobile number', mobile),
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
