import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/screens/UserAccount.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';
import 'package:flutter_app/widgets/CartAppBarIcon.dart';

customAppBar(context, cart, user) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Sports Shoes",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserAccountScreen(
                      user: user,
                    )));
          },
          child: CircleAvatar(
            radius: InterfaceUtilities.borderRadiusSmall,
            child: ClipOval(
              child: user.profilePic == null
                  ? Icon(Icons.person)
                  : Image.network(user.profilePic),
            ),
          ),
        ),
      ),
      actions: [
        cartIcon(cart, context),
      ],
    );

}
