import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Cart", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: cart.itemsCount,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadiusSmall),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeInImage(
                      width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),
                        placeholder: NetworkImage(cart.productList.elementAt(index).photoURL), image: AssetImage("assets/images/png/shoppingBadIcon.png")),
                    Text(cart.productList.elementAt(index).name),
                    Text("\$ ${cart.productList.elementAt(index).price.toString()}")
                  ],
                ),
              )
          ),
        ),
      ),
      floatingActionButton: MaterialButton(
        color: Colors.blue,
        height: InterfaceUtilities.getPercentageOfScreenHeight(context, 0.05),
        onPressed: () {

        },
        child: Text("Check Out total of \$ ${cart.totalPrice.toString()}", style: TextStyle(color: Colors.white, fontSize: 17.0),),
      ),
    );
  }
}
