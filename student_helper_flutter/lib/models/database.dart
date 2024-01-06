import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';

class Database {
  
  // Base URL for your backend. 
  // Update this with your deployed backend URL when you're ready for production.
  static const String baseURL = 'http://localhost:3000';

  // Fetch data method
  static Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/getData'));
      
      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonData = json.decode(response.body);
        
        // You can return or handle the jsonData as required
        return jsonData;
      } else {
        // Handle other status codes (e.g., 404, 500)
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      // Handle any exceptions or errors
      print('Error fetching data: $error');
      return []; 
    }
  }
}
