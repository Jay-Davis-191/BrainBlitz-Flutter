import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';

class Database {
  
  static const String baseURL = 'http://localhost:3000';

  static Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/getUsers'));
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return []; 
    }
  }

    static Future<List<dynamic>> fetchFlashcards() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/getFlashcards'));
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return []; 
    }
  }

    static Future<List<dynamic>> fetchReminders() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/getReminders'));
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return []; 
    }
  }
}
