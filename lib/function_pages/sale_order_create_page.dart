// ignore_for_file: unused_element

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sap_portal/utils/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../models/user_model.dart';

class CreateSaleOrder extends StatefulWidget {
  const CreateSaleOrder({Key? key}) : super(key: key);

  @override
  State<CreateSaleOrder> createState() => _CreateSaleOrderState();
}

class _CreateSaleOrderState extends State<CreateSaleOrder> {
  final TextEditingController _date = TextEditingController();
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
                padding: const EdgeInsets.only(left: 0.0),
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
              // buildTextField(
              //     _customer, context, 'Customer', TextInputType.none),
              const Padding(padding: EdgeInsets.all(8)),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (String? filter) => getData(filter),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                      ),
                      compareFn: (item, sItem) => item.id == sItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'Customers',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    backgroundColor: primaryColor,
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
                    backgroundColor: primaryColor,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        ));
  }

  Widget _customPopupItemBuilderExample2(
    BuildContext context,
    UserModel? item,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.id ?? ''),
        subtitle: Text(item?.name.toString() ?? ''),
        leading: const CircleAvatar(),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}
