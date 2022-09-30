// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:sap_portal/utils/constants.dart';
import '../models/sale_order_model.dart';

class SaleOrderService {
  Future<List<SaleOrders>?> getListSaleOders(
      String fromdate, String todate) async {
    //final queryParameters ={}
    var client = http.Client();
    var uri = Uri.parse('$url$fromdate/$todate');
    print(uri);
    var response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return saleorderFromJson(json);
    }
    return null;
  }
}
