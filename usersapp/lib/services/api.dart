import 'package:http/http.dart' as http;
import 'dart:convert';

class Apis {
  final String baseUrl = 'http://localhost:4000';
  final String version = '/api/v1';
  final String users = '/users';

 Future<http.Response>  fetchUsers() async {
     late http.Response response;
    try {
      final response = await http.get(Uri.parse('$baseUrl$version$users'));

      if (response.statusCode == 200) {
   
      } else {
        throw Exception('Failed to load user data');
      }
        return response;
    } catch (e) {
      // Handle network errors, timeouts, or other exceptions here
      throw Exception('Failed to connect to the server. Please check your internet connection.');
    }
    
  }
}
