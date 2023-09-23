import 'package:http/http.dart' as http;
import 'dart:convert';

class Apis {
  final String baseUrl = 'http://10.0.2.2:4000';
  final String version = '/api/v1';
  final String users = '/users';

  // Function to fetch user data from the API
  Future<http.Response> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$version$users'));

      if (response.statusCode == 200) {
        // Successful response handling goes here
        return response;
      } else {
        // Handle HTTP error status codes (e.g., 404, 500) here
        throw Exception('Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors, timeouts, or other exceptions here
      throw Exception('Failed to connect to the server. Please check your internet connection.');
    }
  }
}
