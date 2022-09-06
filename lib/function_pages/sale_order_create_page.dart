import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sap_portal/utils/constants.dart';

import '../ui/build_text.dart';

class CreateSaleOrder extends StatefulWidget {
  const CreateSaleOrder({Key? key}) : super(key: key);

  @override
  State<CreateSaleOrder> createState() => _CreateSaleOrderState();
}

class _CreateSaleOrderState extends State<CreateSaleOrder> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _customer = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _date.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
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
              Text('Sales order',
                  style: textDisplay.copyWith(
                      fontSize: 30, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: TextFormField(
                    style: textDisplay.copyWith(fontSize: 13),
                    controller: _date,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Posting date",
                        hintStyle: textDisplay),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          _date.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    }),
              ),
              buildTextField(
                  _customer, context, 'Customer', TextInputType.none),
              TextButton.icon(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: const Text('Add item',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300)),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.save_sharp,
                  color: Colors.white,
                ),
                label: const Text('Save',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        ));
  }
}
