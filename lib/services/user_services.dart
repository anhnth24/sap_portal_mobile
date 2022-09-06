import '../models/customer_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class UserService {
  Future<List<Customer>?> getAllCustomers() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return customerFromJson(json);
    }
    return null;
  }
}
