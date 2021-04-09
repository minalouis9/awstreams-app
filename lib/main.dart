import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/screens/Home.dart';
import 'package:flutter_app/services/Auth/Auth.dart';
import 'package:flutter_app/services/Auth/BaseAuth.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BaseAuth>(
            create: (_) => Auth(),
        ),
        ChangeNotifierProvider<Cart>(
            create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.blue, width: 2.0
              ),
              borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadiusSmall),
            ),
          )
        ),
        home: HomeScreen(),
      ),
    );
  }
}