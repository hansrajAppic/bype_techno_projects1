import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL =
      'https://api.example.com'; // Replace with your API base URL

  Future<dynamic> fetchData() async {
    final response = await http
        .get(Uri.parse('$BASE_URL/endpoint')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON response
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
