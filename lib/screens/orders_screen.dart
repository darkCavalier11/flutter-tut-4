import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tut_/providers/orders.dart' show Orders;
import 'package:tut_/widgets/app_drawer.dart';
import 'package:tut_/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItem(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
