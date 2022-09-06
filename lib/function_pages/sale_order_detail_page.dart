import 'package:flutter/material.dart';
import 'package:sap_portal/models/customer_model.dart';
import 'package:sap_portal/ui/build_text.dart';
import 'package:sap_portal/utils/constants.dart';

class DetailSaleOrderPage extends StatefulWidget {
  final Customer customer;
  const DetailSaleOrderPage({Key? key, required this.customer})
      : super(key: key);

  @override
  State<DetailSaleOrderPage> createState() => _DetailSaleOrderPageState();
}

class _DetailSaleOrderPageState extends State<DetailSaleOrderPage> {
  TextEditingController _id = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _id.text = widget.customer.id.toString();
      _username.text = widget.customer.username.toString();
      _email.text = widget.customer.email.toString();
      _phone.text = widget.customer.phone.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('User information',
                  style: textDisplay.copyWith(
                      fontSize: 30, fontWeight: FontWeight.w600)),
              buildTextField(_id, context, 'User Id', TextInputType.none),
              buildTextField(
                  _username, context, 'User name', TextInputType.none),
              buildTextField(_email, context, 'Email', TextInputType.none),
              buildTextField(_phone, context, 'Phone', TextInputType.none),
            ],
          ),
        ));
  }
}
