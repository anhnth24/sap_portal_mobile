// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/sidebar.dart';
import 'package:sap_portal/models/customer_model.dart';
import 'package:sap_portal/services/user_services.dart';
import 'package:sap_portal/utils/constants.dart';

class SaleOrder extends StatefulWidget {
  const SaleOrder({Key? key}) : super(key: key);

  @override
  _SaleOrderState createState() => _SaleOrderState();
}

class _SaleOrderState extends State<SaleOrder> {
  List<Customer>? customers;

  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getCustomers();
  }

  getCustomers() async {
    customers = await UserService().getAllCustomers();
    if (customers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sale order"),
        backgroundColor: primaryColor,
      ),
      drawer: const SideBar(),
      backgroundColor: backgroundColor,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount:
                customers != null ? customers?.length : 0, //customers?.length,
            itemBuilder: ((context, index) {
              return Container(
                child: Text(customers![index].name, style: textDisplay),
              );
            })),
      ),
    );
  }
}
