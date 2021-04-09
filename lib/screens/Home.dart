import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Product.dart';
import 'package:flutter_app/screens/UserAccount.dart';
import 'package:flutter_app/services/Auth/BaseAuth.dart';
import 'package:flutter_app/utils/Catalog.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';
import 'package:flutter_app/widgets/Appbar.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _pageSize = 14;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);
  User user = User();

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await Future.delayed(Duration(seconds: 1), () => Catalog.productList);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _loginUser(BuildContext context) {
    context.read<BaseAuth>().login().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  _buildProductListItem({Product product}) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(InterfaceUtilities.borderRadiusSmall)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                height: InterfaceUtilities.getPercentageOfScreenHeight(
                    context, 0.15),
                image: NetworkImage(product.photoURL),
                placeholder:
                    AssetImage("assets/images/png/shoppingBagIcon.png"),
              ),
              Divider(),
              Text(
                product.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              // Padding(padding: EdgeInsets.symmetric(vertical: InterfaceUtilities.dividerHeightSmall)),
              Text("\$ ${product.price.toString()}",
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _loginUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: customAppBar(context, cart, user),
      body: SafeArea(
        child: PagedGridView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) =>
                    _buildProductListItem(product: product)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.95, crossAxisCount: 2)),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pagingController.dispose();
    super.dispose();
  }
}
