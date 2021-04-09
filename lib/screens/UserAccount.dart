import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';

class UserAccountScreen extends StatelessWidget {
  final User user;

  UserAccountScreen({@required this.user});

  _buildUserInfoField(String label, IconData icon, int maxLines){
    return TextField(
      controller: TextEditingController(text: label),
      readOnly: true,
      maxLines: maxLines,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadiusSmall),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("User Profile", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: InterfaceUtilities.borderRadiusExtraLarge,
                  child: ClipOval(
                      child: FadeInImage(
                    image: NetworkImage(user.profilePic),
                    placeholder: AssetImage("assets/images/png/personIcon.png"),
                  )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                _buildUserInfoField(user.name, Icons.person, 1),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                _buildUserInfoField(user.city, Icons.pin_drop, 1),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                _buildUserInfoField(user.bio, Icons.perm_contact_calendar_rounded, 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
