// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/sidebar.dart';
import 'package:sap_portal/utils/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Saleorder extends StatefulWidget {
  const Saleorder({Key? key}) : super(key: key);

  @override
  _SaleorderState createState() => _SaleorderState();
}

class _SaleorderState extends State<Saleorder> {
  TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sale order"),
          backgroundColor: primaryColor,
        ),
        drawer: const SideBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            onChanged: print,
            selectedItem: "Brazil",
          )
        ]));
  }
}