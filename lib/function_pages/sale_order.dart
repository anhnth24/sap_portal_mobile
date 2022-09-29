// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sap_portal/function_pages/sale_order_create_page.dart';
import 'package:sap_portal/function_pages/sale_order_detail_page.dart';
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
  TextEditingController controller = TextEditingController();
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const CreateSaleOrder())));
          },
          backgroundColor: primaryColor,
          focusColor: Colors.red,
          child: const Icon(Icons.add_box_outlined)),
      appBar: AppBar(
        title: const Text("Sale order"),
        backgroundColor: primaryColor,
      ),
      drawer: const SideBar(),
      backgroundColor: backgroundColor,

      // body: Column(
      //   children: <Widget>[
      //     Container(
      //       color: Theme.of(context).primaryColor,
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Card(
      //           child: ListTile(
      //             leading: const Icon(Icons.search),
      //             title: TextField(
      //               controller: controller,
      //               decoration: const InputDecoration(
      //                   hintText: 'Search', border: InputBorder.none),
      //               onChanged: onSearchTextChanged,
      //             ),
      //             trailing: IconButton(
      //               icon: const Icon(Icons.cancel),
      //               onPressed: () {
      //                 controller.clear();
      //                 onSearchTextChanged('');
      //               },
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: _searchResult.isNotEmpty || controller.text.isNotEmpty
      //           ? ListView.builder(
      //               itemCount: _searchResult.length,
      //               itemBuilder: (context, i) {
      //                 return Card(
      //                   margin: const EdgeInsets.all(0.0),
      //                   child: ListTile(
      //                     leading: CircleAvatar(
      //                       backgroundImage: NetworkImage(
      //                         _searchResult[i].profileUrl,
      //                       ),
      //                     ),
      //                     title: Text(
      //                         '${_searchResult[i].firstName} ${_searchResult[i].lastName}'),
      //                   ),
      //                 );
      //               },
      //             )
      //           : ListView.builder(
      //               itemCount: _userDetails.length,
      //               itemBuilder: (context, index) {
      //                 return Card(
      //                   margin: const EdgeInsets.all(0.0),
      //                   child: ListTile(
      //                     leading: CircleAvatar(
      //                       backgroundImage: NetworkImage(
      //                         _userDetails[index].profileUrl,
      //                       ),
      //                     ),
      //                     title: Text(
      //                         '${_userDetails[index].firstName} ${_userDetails[index].lastName}'),
      //                   ),
      //                 );
      //               },
      //             ),
      //     ),
      //   ],
      // ),

      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount:
                customers != null ? customers?.length : 0, //customers?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(customers![index].name),
                  subtitle: Text(customers![index].username.toString()),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(imgFis),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailSaleOrderPage(
                              customer: customers![index],
                            )));
                  },
                ),
              );
            }),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _userDetails) {
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) {
        _searchResult.add(userDetail);
      }
    }

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

const String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
