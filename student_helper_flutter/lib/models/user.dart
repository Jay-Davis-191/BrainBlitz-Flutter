import 'package:flutter/material.dart';

class User {
  String name = ''; 
  String email = '';

  User(String name, String email) {
    this.name = name; 
    this.email = email; 
  } 

  getName () {
    return this.name;
  }

  getEmail () {
    return this.email; 
  }

}